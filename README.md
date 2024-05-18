# TermBlur-iOS

*흐려지는 단어 암기장, 내 손 안의 텀블러.* 
34기 NOW SOPT 솝커톤 iOS 4팀 **텀블러 TermBlur** 프로젝트입니다.

- 34기 NOW SOPT SOPKATHON (2024.05.18 ~ )

<br>

## 🛠️ Main Function

- 카테고리
- 단어 입력하기
- 단어 암기하기
- 외운 단어 확인하기

## 🍎 iOS Developer

| [가현](https://github.com/mcrkgus) | [정빈](https://github.com/kingjeongkong) | [민서](https://github.com/FpRaArNkK) | [연서](https://github.com/oyslucy) | 
| :--: | :--: | :--: | :--: |
| <img alt="가현" src="https://github.com/SOPKATHON-iOS-TEAM4/iOS/assets/84556636/5feff183-0474-492e-a8c2-d0c7f67e013e" width="300" height="300"/> | <img alt="정빈" src="https://github.com/SOPKATHON-iOS-TEAM4/iOS/assets/84556636/ba75edb2-db30-4eed-8dee-9e8520ce58df" width="300" height="300"/> | <img alt="민서" src="https://github.com/SOPKATHON-iOS-TEAM4/iOS/assets/84556636/3fd0433e-627d-48f6-bfa7-c62d460af2c9" width="300" height="300"/> | <img alt="연서" src="https://github.com/SOPKATHON-iOS-TEAM4/iOS/assets/84556636/58e074a6-b95c-4972-a2d1-b7ffea9ed8ba" width="300" height="300"/> |
| <p align = "center">온보딩 / 카테고리 | <p align = "center"> 단어 입력 | <p align = "center"> 단어 암기 | <p align = "center"> 단어 확인 |


<br>

## 📦 Libraries

| Library | Version | Description |
| --- | --- | --- |
| [Moya](https://github.com/Moya/Moya) | 15.0.0 | Networking 시 사용 |
| [SnapKit](https://github.com/SnapKit/SnapKit) | 5.6.0 | UI AutoLayout을 잡을 때 사용 |
| [Then](https://github.com/devxoul/Then) | 3.0.0 | 클로저를 통한 인스턴스 초기화를 할 수 있도록 도와주는 라이브러리 |

<br>

## 📖 Coding Convention

### 1. Base Rule

- StyleShare 의 Swift Style Guide를 기본으로 합니다.
- 세부적인 사항은 아래 원칙을 따른다.

```
1. 더 이상 상속되지 않을 class에는 꼭 final 키워드를 붙이도록 한다.
2. class에서 사용되는 프로퍼티는 모두 private으로 선언하자. (외부에서 접근할 일이 있다면 함수를 통해 접근하도록 하자..)
3. 길어지더라도 약어와 생략을 지양하자 (VC, TVC, Config 등등 XXX → ViewController, TableViewCell, Configure)
4. Global 위치에 함수를 만들 것이면 퀵헬프 주석을 한 줄이라도 꼭 달아주자.
5. 강제 언래핑 사용 X
6. self를 되도록 빼기
7. Class, Struct, Enum : Upper / 나머지 : Lower
```

### 2. 네이밍

```
프로토콜 : ~~~Protocol의 형식을 사용하고, Delegate Protocol의 경우 ~~Delegate를 사용한다.

변수 : UI Property일 경우 어떤 UI Property인지 명시해주자 (예, informationStackView)

함수 :
 1) setupStyle(), setupHierarchy(), setupLayout(), setupCell()
 2) 함수 이름 형식은 주어+동사 혹은 주어+동사+목적어의 형태로 사용한다. (예, nextButtonTapped())
 3) API 관련 함수일 경우 GET POST PUT DELETE를 함수의 가장 앞에 붙인다.
 4) API 관련 함수를 제외하고 get set 사용을 지양한다. (대신 fetch setup 사용)
 
파일명 : 너무 긴 네이밍일 경우 상의 후 결정
```

### 3. 개행

```
- 기본 프레임워크를 가장 상단에 import 후, 개행 한 뒤 나머지 프레임워크를 ABC 순으로 적는다.
- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 파라미터 이름을 기준으로 줄바꿈합니다.(파라미터가 3개 이상이면 줄바꿈)
- 빈 줄에는 공백이 포함되지 않도록 합니다.
- 모든 파일은 빈 줄로 끝나도록 합니다.
- MARK 구문 위와 아래에는 공백이 필요합니다.
- 나머지는 적당히 알아서 깔끔하고 센스있게.
```

<br>

## 🙌 Git Convention / Branch Strategy

### 1. Git-flow 전략

```bash
1. 작업할 내용에 대해 이슈를 판다.
2. 내 로컬에서 develop 브랜치가 최신화 되어있는지 확인한다. (develop 브랜치는 항상 pull을 받아 최신화를 시키자)
3. develop 브랜치로부터 새 브랜치를 만든다. (브랜치명은 `커밋타입/#이슈번호-뷰이름`)
4. 만든 브랜치에서 작업을 한다
5. 커밋은 쪼개서 작성하며 커밋 메시지는 컨벤션을 따른다.
6. 작업할 내용을 다 끝내면 ⭐️⭐️⭐️에러가 없는지 잘 돌아가는지 (안터지는지) 확인⭐️⭐️⭐️한 후 push한다.
7. PR을 작성한 후, 리뷰나 수정사항을 반영해준 뒤 develop에 merge한다. (단, PR시 추가되는 코드 줄 수를 500줄로 제한한다.)
```

### 2. Issue & PR title

- 담당자, 리뷰어, 라벨을 꼭 추가하도록 한다.

```bash
Issue : [종류] 작업명 (예시: [Feat] Main View UI 구현)

PR : [종류] #이슈번호 작업명 (예시: [Feat] #13 Main View UI 구현)
```

### 3. Commit Message

```bash
- [Feat] : 새로운 기능 구현
- [Fix] : 버그, 오류 해결
- [Chore] : 코드 수정, 내부 파일 수정, 애매한 것들이나 잡일은 이걸로!
- [Add] : 라이브러리 추가, 에셋 추가
- [Del] : 쓸모없는 코드 삭제
- [Docs] : README나 WIKI 등의 문서 개정
- [Refactor] : 전면 수정이 있을 때 사용합니다
- [Setting] : 프로젝트 설정관련이 있을 때 사용합니다.
- [Network] : 네트워크를 연결합니다.
- [Merge] - {#이슈번호} Pull Develop
```

### 4. Code Review

```bash
P1 : 꼭 반영해주세요

P2 : 반영하면 좋을 것 같습니다.

P3 : 단순 의견 제시 (무시해도 됩니다)

예) P1 ) 컨벤션에 따라 함수 네이밍을 ~~로 바꿔야 할 것 같아요!
```

<br>

## 📂 Foldering Convention

```bash
├── Application
│   ├── AppDelegate
│   ├── SceneDelegate
├── Global
│   ├── Extension
│   ├── Literals
│   │   ├── Image
│   │   ├── String
│   ├── Protocols
│   ├── Resources
│   │   ├── Font
│   │   ├── Assets
│   │   ├── Info.plist
│   ├── Supporting Files
│   │   ├── Base
├───├───├───── LaunchScreen
├── Network
│   ├── View1
│   |   ├── DTO
│   |   ├── Router
|   |   ├── Service
├── Presentation
│   ├── Scene1
│   │   │   ├── Views
│   │   │   ├── ViewControllers
│   │   │   ├── Cells
│   │   │   │   ├── Cell1
├───├───├───├───├── Cell2
```
<br>

## 🎆 Ayo Before
![KakaoTalk_Photo_2024-05-19-00-12-57](https://github.com/SOPKATHON-iOS-TEAM4/iOS/assets/84556636/9146fe72-82b2-4ebe-85f0-9207ac7cab75)


