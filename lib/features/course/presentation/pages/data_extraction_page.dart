// 코스 정보 추출 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/course/data/models/course_extraction_failure.dart';
import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/presentation/providers/extracted_course_provider.dart';
import 'package:plan_b/features/course/presentation/providers/my_course_provider.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_list.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_list_skeleton.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/background/bg_top_ellipse.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class DataExtractionPage extends ConsumerStatefulWidget {
  const DataExtractionPage({super.key, required this.links});

  final List<String> links; // 코스 추가 화면에서 입력한 링크

  @override
  ConsumerState<DataExtractionPage> createState() => _DataExtractionPageState();
}

class _DataExtractionPageState extends ConsumerState<DataExtractionPage> {
  static const double _listTopGap = 32;       // 헤더 ~ 첫 카드 간격
  static const double _contentBottomGap = 24; // 마지막 카드 ~ 로컬 탭바 간격

  final Set<String> _addingIds = {}; // 추가 요청 중인 코스
  final Set<String> _addedIds = {};  // 이미 추가한 코스
  bool _isLeaving = false;           // 추출 실패로 이전 화면으로 돌아가는 중 (pop 중복 방지)

  /// 실패 사유별 안내 문구
  static String _failureMessageOf(CourseExtractionFailure failure) =>
      switch (failure) {
        CourseExtractionFailure.noCourseFound =>
          '링크에서 추가할 수 있는 코스를\n찾지 못했어요.',
        CourseExtractionFailure.unsupportedLink =>
          '네이버 블로그, 티스토리\n링크만 지원합니다.',
        CourseExtractionFailure.unknown =>
          '코스를 추출하지 못했어요.\n다른 링크로 다시 시도해주세요.',
      };

  /// 추출 결과 확인: 실패 / 코스 없음이면 안내 문구를 담아 코스 추가 화면으로
  void _onExtractionChanged(AsyncValue<List<ExtractedCourse>> next) {
    if (next.isLoading) return;

    final CourseExtractionFailure? failure = next.when(
      loading: () => null,
      // 저장소에서 사유를 담아 던진 예외가 아니면(planId 오류, 응답 변환 실패 등) 그 외 에러로 처리
      error: (error, _) => error is CourseExtractionException
          ? error.failure
          : CourseExtractionFailure.unknown,
      // 서버가 성공 응답으로 빈 목록을 보낸 경우도 코스 없음으로 처리
      data: (courses) =>
          courses.isEmpty ? CourseExtractionFailure.noCourseFound : null,
    );
    if (failure != null) _leaveWithFailure(failure);
  }

  /// 코스 추가 화면으로 돌아가며 안내 문구 전달 (입력한 링크 유지)
  /// 토스트는 코스 추가 화면에서 띄움: 그 화면 Scaffold 기준이어야 다른 토스트처럼 CTA 위 16px에 표시됨
  void _leaveWithFailure(CourseExtractionFailure failure) {
    if (_isLeaving || !mounted) return;

    // 사용자가 직접 뒤로가기를 눌러 이미 스택에서 빠진 경우 (퇴장 전환 중이라 아직 mounted)
    // 이때 pop하면 이 화면이 아니라 맨 위에 있는 코스 추가 화면이 닫히므로 실패 처리를 건너뜀
    // (_isLeaving과 별개: 이 화면이 직접 pop했는지가 아니라, 바깥에서 빠졌는지를 라우트에서 바로 확인)
    final bool isCurrentRoute = ModalRoute.of(context)?.isCurrent ?? false;
    if (!isCurrentRoute) return;

    _isLeaving = true;
    context.pop(_failureMessageOf(failure));
  }

  /// '+' 버튼: 내 플랜에 코스 추가 요청 > 버튼 상태, 토스트 처리
  /// (요청과 나의 여행 코스 갱신은 MyCourseNotifier가 처리: 화면을 닫아도 반영됨)
  Future<void> _addCourse(ExtractedCourse course) async {
    final String? planId = ref.read(selectedPlanIdProvider);
    if (planId == null) return;

    // await 전에 notifier를 잡아둠 (화면이 닫힌 뒤에는 ref를 쓸 수 없음)
    final MyCourseNotifier notifier =
        ref.read(myCourseProvider(planId).notifier);

    setState(() => _addingIds.add(course.id));
    try {
      await notifier.addExtractedCourse(course);
      if (!mounted) return; // 화면이 닫혔으면 토스트, 버튼 상태만 생략 (반영은 이미 완료)

      setState(() => _addedIds.add(course.id));
      showToast(context, text: '코스를 내 플랜에 추가했어요');
    } catch (_) {
      if (!mounted) return;
      showToast(
        context,
        text: '코스를 추가하지 못했어요.\n다시 시도해주세요',
        type: ToastType.warning,
      );
    } finally {
      if (mounted) setState(() => _addingIds.remove(course.id));
    }
  }

  /// 고정 헤더 + 카드 목록 스크롤 영역 (로딩 스켈레톤 / 추출 결과 공통)
  Widget _buildCourseBody(
    EdgeInsets inset, {
    required String title,
    required Widget list,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 헤더는 고정, 카드 목록만 스크롤 (헤더 경계에서 잘림)
        TitleHeader(
          title: title,
          subtitle: '각 코스를 확인하고, 마음에 드는 코스는\n'
              '내 여행 플랜에 추가해 보세요.',
          size: TitleHeaderSize.md,
        ),
        Expanded(
          child: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.fromLTRB(
              24,
              _listTopGap,
              24,
              inset.bottom + _contentBottomGap,
            ),
            child: list,
          ),
        ),
      ],
    );
  }

  /// 추출 중 화면 (실패해서 화면이 닫히는 동안에도 깜빡이지 않도록 그대로 사용)
  Widget _buildLoadingBody(EdgeInsets inset) {
    return _buildCourseBody(
      inset,
      title: '예산에 맞는 코스 추출 중...',
      list: const ExtractedCourseListSkeleton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String linksKey = extractedCoursesKeyOf(widget.links);
    final AsyncValue<List<ExtractedCourse>> asyncCourses =
        ref.watch(extractedCoursesProvider(linksKey));

    // 실패 / 코스 없음 처리 (안내 문구를 담아 이전 화면으로)
    ref.listen<AsyncValue<List<ExtractedCourse>>>(
      extractedCoursesProvider(linksKey),
      (_, next) => _onExtractionChanged(next),
    );

    return Scaffold(
      backgroundColor: AppColors.blue50,
      extendBodyBehindAppBar: true, // 배경 ellipse가 상단바 뒤까지 깔리도록
      appBar: const TopAppBar(), // 뒤로가기 > 코스 추가 화면 (입력한 링크 유지)
      body: Builder(
        builder: (context) {
          // top: 상태바 + 상단바 / bottom: 로컬 탭바 + 홈 인디케이터 (LocalShell extendBody)
          final EdgeInsets inset = MediaQuery.paddingOf(context);

          return Stack(
            fit: StackFit.expand,
            children: [
              const BgTopEllipse(top: 15), //ellipse가 화면 상단 y: 15부터 시작
              const BgBottomEllipse(),
              Positioned(
                top: inset.top,
                left: 0,
                right: 0,
                bottom: 0,
                child: asyncCourses.when(
                  loading: () => _buildLoadingBody(inset),
                  // 실패 / 코스 없음은 ref.listen에서 pop 처리 (토스트는 코스 추가 화면)
                  error: (_, _) => _buildLoadingBody(inset),
                  data: (courses) => courses.isEmpty
                      ? _buildLoadingBody(inset)
                      : _buildCourseBody(
                          inset,
                          title: '예산에 맞는 코스 추출 완료!',
                          list: ExtractedCourseList(
                            courses: courses,
                            disabledIds: {..._addingIds, ..._addedIds},
                            onAddPressed: _addCourse,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}