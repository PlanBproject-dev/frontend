# PlanB <img width="100" alt="PlanB App Icon" src="https://github.com/user-attachments/assets/a3ed439f-3382-4913-8025-890a811e4661" align="left" />

<h3>AI Travel Planner on My Budget</h3>

> 내 예산과 목표에 맞춰 AI가 여행 플랜을 추천하고, 출발 전까지의 준비 및 저축까지 함께 관리해 주는 여행 플래너 앱

<br>

<img alt="project thumbnail" src="https://github.com/user-attachments/assets/db230fb5-2a2b-4354-a9b0-78f0f71696d2" />

<br><br>

## ✈️ 프로젝트 설명

**PlanB**는 사용자의 예산에 최적화된 '실현 가능한' 여행을 설계하는
AI 기반 스케줄링 플랫폼입니다.
1. 사용자는 **지갑 기준(예산 먼저)** 또는 **목표 기준(여행지 먼저)** 중 하나를 골라 여행 조건을 입력하고
2. AI가 조건에 맞는 여행 플랜을 추천합니다.
3. 플랜을 확정하면 출발일까지 **월별 준비 가이드**와 **나의 여행 코스**를 따라가며 여행을 준비할 수 있습니다.

<br>

## 🌎 주요 기능

| &nbsp;기능&nbsp; | 설명 |
| --- | --- |
| 1. 맞춤 여행 체크 | 여행 계획 기준(지갑 기준 / 목표 기준) 선택 → 기본 정보, 예산, 세부 여행 취향을 단계별로 입력 |
| 2. 여행 고르기 | 사용자의 입력 조건을 분석해 AI가 여행 플랜을 추천: 티켓/영수증 형태의 카드로 제공된 여행 플랜을 비교하여 선택 → 나의 플랜 생성 완료 |
| 3. 홈 | 내 여행 플랜 목록을 상태(예정 / 진행 / 완료)별로 확인 가능 |
| 4. 나의 여행 플래너 | 확정한 플랜의 기본 정보, 주요 코스, 항목별 예상 비용을 한눈에 확인 |
| 5. 월별 여행 준비 가이드 | 여행 출발일까지 월별 / 전체 타임라인으로 여행 준비 항목을 확인하고 월별로 준비 |
| 6. 여행 코스 | 웹에서 찾은 링크를 붙여 넣으면 코스 정보를 추출해 나의 여행 코스에 추가 |

<br>

## 🧭 기술 스택

| 구분 | 사용 기술 |
| --- | --- |
| Framework | Flutter 3.50.1 (Dart 3.14.0) |
| 상태 관리 | flutter_riverpod |
| 라우팅 | go_router (StatefulShellRoute) |
| 네트워크 | dio (+ 인증 인터셉터) |
| 모델 / 직렬화 | freezed, json_serializable, build_runner |
| 인증 | kakao_flutter_sdk_user, google_sign_in, flutter_secure_storage |
| 환경 변수 | flutter_dotenv |
| 기타 | flutter_svg, url_launcher, flutter_native_splash, flutter_launcher_icons |
| 협업 | GitHub Issues / Projects, CodeRabbit (AI 코드 리뷰) |

<br>

## 🛫 설치 및 실행

### 1. 요구 사항
- Flutter SDK 3.47.0 이상 (개발 기준: 3.50.1 / Dart 3.14.0)
- Xcode (iOS 빌드), CocoaPods
- iOS 15.0 이상 (실기기/시뮬레이터)

### 2. 프로젝트 클론 및 패키지 설치
```bash
git clone https://github.com/PlanBproject-dev/frontend.git
cd frontend
flutter pub get
```

### 3. 환경 변수 설정
프로젝트 루트에 `.env` 파일을 만들고 아래 값을 채워주세요. (실제 값은 팀 노션으로 공유)
```
BASE_URL=
KAKAO_NATIVE_KEY=
GOOGLE_IOS_CLIENT_ID=
GOOGLE_SERVER_CLIENT_ID=
```

### 4. 코드 생성 (freezed / json_serializable)
모델을 수정했다면 생성 파일을 다시 만들어 주세요.
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Flutter 앱 실행
사용 가능한 기기에서 디버그 모드로 앱 실행:
```bash
flutter run
```
<br>

지정한 실물 아이폰에서 릴리즈 모드로 앱 실행:
```bash
# 기기 아이디: flutter devices에 표시되는 실제 아이폰 ID

flutter devices
flutter run --release -d "아이폰_기기_ID"
```

<br>

## 🏝️ 브랜치 전략

```
main        배포용 브랜치
 └─ develop     개발 통합 브랜치 (모든 PR의 base)
     └─ feature/#이슈번호-작업내용   기능 단위 작업 브랜치
```

1. 작업 시작 전 **이슈를 먼저 생성**하고, 이슈 번호로 브랜치를 생성합니다. (ex. `feature/#97-get-timeline-guide-api`)
2. 작업이 끝나면 `develop`을 base로 PR을 올리고, 리뷰 후 머지합니다.
3. `develop`이 안정화되면 `main`에 반영합니다.

### 커밋 컨벤션
`#이슈번호 [태그] 작업 내용`

| 태그 | 의미 |
| --- | --- |
| `[FEAT]` | 새 기능 구현 |
| `[FIX]` | 버그 수정 |
| `[MOD]` | 기존 코드 수정 |
| `[UI]` | UI 구현 작업 |
| `[ADD]` | 파일, 코드, 에셋 등 추가 |
| `[REFACTOR]` | 리팩토링 |
| `[CHORE]` | 기타 잡다한 수정 (불필요한 코드 삭제 등) |
| `[SETTING]` | 프로젝트 및 환경 세팅 |

<br>

## 📁 폴더 구조

### 구조 관리 요약
- 기능(feature) 단위로 폴더를 나눕니다.
- 각 기능 안에서 `data` / `presentation` 레이어를 분리하여 관리합니다.

<br>

```
lib/
├── main.dart                 # 앱 진입점
├── core/                     # 앱 전역 인프라
│   ├── auth/                 # 로그인 상태(authProvider), 세션 관리
│   ├── config/               # 라우팅 (router, app_routes, shell, not_found)
│   ├── network/              # dio 설정, 인증 인터셉터, 공통 요청 처리
│   ├── storage/              # 토큰 / 프로필 로컬 저장 (secure storage)
│   ├── theme/                # Colors / Text Styles / Effects / Theme
│   └── env.dart              # 필수 환경변수
│
├── features/                 # 기능 단위 모듈
│   ├── login/                # 소셜 로그인
│   ├── home/                 # 홈 (여행 플랜 목록)
│   ├── trip_check/           # 맞춤 여행 체크 (여행 플랜 생성 조건 입력)
│   ├── trip_select/          # AI 추천 여행 고르기
│   ├── planner/              # 나의 여행 플래너
│   ├── monthly_guide/        # 월별 여행 준비 가이드
│   ├── course/               # 나의 여행 코스
│   └── my_page/              # 마이페이지 (설정)
│
└── shared/                   # 여러 기능에서 함께 쓰는 코드 관리.
    ├── models/               # 공용 모델 (User, Destination 등)
    ├── providers/            # 공용 상태 (전역 로딩, 선택된 플랜 id)
    └── widgets/              # 공용 위젯 (버튼, 내비게이션, 모달, 토스트 등)
```

각 feature 내부 구조:
```
features/<feature>/
├── data/
│   ├── models/               # 앱에서 쓰는 도메인 모델
│   │   └── dto/              # 서버 요청/응답 DTO
│   └── repositories/         # API 호출 + DTO <-> 모델 변환
└── presentation/
    ├── pages/                # 화면
    ├── providers/            # Riverpod 상태 (Notifier)
    └── widgets/              # 해당 기능 전용 위젯
```

<br>

## 👩‍💻 핵심 설계

### 1️⃣ 라우팅 전략: Shell로 탭 구조를 분리

- `go_router` 기반으로 화면을 세 종류로 나눴습니다.
- 자세한 내용은 [라우트 규칙 노션](https://app.notion.com/p/4144e2264bfc80d2b3e4fd7c4605c809) 참고

|구분|화면|방식|
|---|---|---|
|글로벌 Shell|홈, 마이페이지|`StatefulShellRoute.indexedStack`|
|로컬 Shell|플래너, 월별 가이드, 여행 코스|홈 하위 Shell, 글로벌 탭바를 덮음|
|탭바 없는 화면|로그인, 맞춤 여행 체크, 여행 고르기|루트 내비게이터의 `GoRoute`|

- 탭을 오가도 각 탭의 화면 스택과 스크롤 위치가 유지됩니다.
- 경로는 `app_routes.dart`에서 상수로 관리하고, 로그인 상태에 따라 `redirect`로 접근을 제어합니다.
- 단계형 플로우(맞춤 여행 체크)는 `push`로 쌓아 뒤로가기로 이전 단계에 돌아갈 수 있게 합니다.

### 2️⃣ 데이터 관리 전략: 불변 모델 하나로 입력 관리

여러 화면에 걸친 맞춤 여행 체크 입력값을 불변(freezed) 모델 `TripCheckDraft` 하나에 모아 관리합니다.

- **단일 상태 소스**: 플로우 전체가 Riverpod Notifier 하나를 공유해, 화면 간 값 전달이 필요 없습니다.
- **불변 + `copyWith`**: 상태 변경은 Notifier 메서드에서만 일어나 추적이 쉽습니다.
- **모델과 DTO 분리**: 화면은 `TripCheckDraft`만 다루고, 서버 요청 시에만 DTO로 변환합니다.

<br>

## 🗺️ 시스템 아키텍쳐

<img alt="system_architecture" src="https://github.com/user-attachments/assets/5fc5fd11-b0bf-422c-855e-f5bee4c72591" />

<br>

## 🧑‍🚀 Contributor

| 염주원 [Github](https://github.com/HiJuwon) |
| :---: |
| <img src="https://github.com/HiJuwon.png" width="200" height="200"/> |
| Product Design,<br>Flutter Development |


<br>

## 🔗 기타

PlanB Frontend Kanban: [link](https://github.com/orgs/PlanBproject-dev/projects/1)

<br><br>

<img alt="footer image" src="https://github.com/user-attachments/assets/2d217d4a-a04e-447f-b158-9f42b48a5669" />
