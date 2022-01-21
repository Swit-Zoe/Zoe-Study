# Diff

Created: January 21, 2022 1:21 PM

## Diff가 뭔지

[Ordered Collection Diffing](https://thoughtbot.com/blog/ordered-collection-diffing?utm_campaign=iOS%2BDev%2BWeekly&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B405)

## 라이브러리 종류

- [Differ](https://github.com/tonyarnold/Differ) (by [@tonyarnold](https://github.com/tonyarnold))
- [DifferenceKit](https://github.com/ra1028/DifferenceKit) (by [@ra1028](https://github.com/ra1028/))
- [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources) (by [@kzaher](https://github.com/kzaher), [RxSwift Community](https://github.com/RxSwiftCommunity))
- [IGListKit](https://github.com/Instagram/IGListKit) (by [Instagram](https://github.com/Instagram))
- [FlexibleDiff](https://github.com/RACCommunity/FlexibleDiff) (by [@andersio](https://github.com/andersio), [RACCommunity](https://github.com/RACCommunity))
- [DeepDiff](https://github.com/onmyway133/DeepDiff) (by [@onmyway133](https://github.com/onmyway133))
- [Dwifft](https://github.com/jflinter/Dwifft) (by [@jflinter](https://github.com/jflinter))
- [Changeset](https://github.com/osteslag/Changeset) (by [@osteslag](https://github.com/osteslag))

## 라이브러리 비교

### 속도, 시간복잡도

실제 속도 측정 테이블 (2022.01.21)

![Untitled](https://user-images.githubusercontent.com/97005335/150482974-45d55a10-b7d4-4be3-aff1-29595964090c.png)

| 라이브러리 종류                   | 등수  | 점수  | (+ 시간복잡도) |
| -------------------------- | --- | --- | --------- |
| DifferenceKit              | 1   | 8   | O(N)      |
| RxDataSources              | 2   | 7   | O(N)      |
| Differ                     | 4   | 5   | O(NM)     |
| IGListKit                  | 3   | 6   | O(N)      |
| FlexibleDiff               | 5   | 4   | O(N)      |
| DeepDiff                   | 7   | 2   | O(N)      |
| Dwifft                     | 8   | 1   | O(NM)     |
| Swift.CollectionDifference | 6   | 3   | O(NM)     |

### 지원되는 Collection 유형

| 라이브러리 종류                   | 1차원 collection | 2차원 collection(Sectioned) | element/section 복제 | 점수  |
| -------------------------- | -------------- | ------------------------- | ------------------ | --- |
| DifferenceKit              | O              | O                         | O                  | 3   |
| RxDataSources              | X              | O                         | X                  | 1   |
| Differ                     | O              | O                         | O                  | 3   |
| IGListKit                  | O              | X                         | O                  | 2   |
| FlexibleDiff               | O              | O                         | O                  | 3   |
| DeepDiff                   | O              | X                         | O                  | 2   |
| Dwifft                     | O              | O                         | O                  | 3   |
| Swift.CollectionDifference | O              | X                         | O                  | 2   |

### 지원되는 Element Diff 동작들

| 라이브러리 종류                   | Delete | Insert | Move | Reload | Section간 Move | 점수  |
| -------------------------- | ------ | ------ | ---- | ------ | ------------- | --- |
| DifferenceKit              | O      | O      | O    | O      | O             | 5   |
| RxDataSources              | O      | O      | O    | O      | O             | 5   |
| Differ                     | O      | O      | O    | X      | X             | 3   |
| IGListKit                  | O      | O      | O    | O      | X             | 4   |
| FlexibleDiff               | O      | O      | O    | O      | X             | 4   |
| DeepDiff                   | O      | O      | O    | O      | X             | 4   |
| Dwifft                     | O      | O      | X    | X      | X             | 2   |
| Swift.CollectionDifference | O      | O      | O    | X      | X             | 2   |

### Section Diff 지원 여부

| 라이브러리 종류                   | Delete | Insert | Move | Reload | 점수  |
| -------------------------- | ------ | ------ | ---- | ------ | --- |
| DifferenceKit              | O      | O      | O    | O      | 4   |
| RxDataSources              | O      | O      | O    | X      | 3   |
| Differ                     | O      | O      | O    | X ?    | 3   |
| IGListKit                  | X      | X      | X    | X      | 0   |
| FlexibleDiff               | O      | O      | O    | O      | 4   |
| DeepDiff                   | X      | X      | X    | X      | 0   |
| Dwifft                     | O      | O      | X    | X      | 2   |
| Swift.CollectionDifference | X      | X      | X    | X      | 0   |

### repository star 개수

| 라이브러리 종류                   | star 수 | 등수  | 점수  |
| -------------------------- | ------ | --- | --- |
| DifferenceKit              | 3K     | 2   | 7   |
| RxDataSources              | 2.8K   | 3   | 6   |
| Differ                     | 601    | 6   | 3   |
| IGListKit                  | 12.2K  | 1   | 8   |
| FlexibleDiff               | 104    | 7   | 2   |
| DeepDiff                   | 2K     | 4   | 5   |
| Dwifft                     | 1.8K   | 5   | 4   |
| Swift.CollectionDifference |        |     |     |

### 점수 총합

| 라이브러리 종류                   | star 제외 점수 | star 포함 점수 | 등수  |
| -------------------------- | ---------- | ---------- | --- |
| DifferenceKit              | 20         | 27         | 1   |
| RxDataSources              | 16         | 22         | 2   |
| Differ                     | 14         | 17         | 4   |
| IGListKit                  | 12         | 20         | 3   |
| FlexibleDiff               | 15         | 17         | 4   |
| DeepDiff                   | 8          | 13         | 6   |
| Dwifft                     | 8          | 12         | 7   |
| Swift.CollectionDifference | 7          | -          |     |

## 연습 프로젝트

- 사용해볼 라이브러리
  - DifferenceKit (사유 : 등수 1등)
  - RxDataSources (사유 : 등수 2등)
  - IGListKit (사유 : star수 1등)
  - Differ (사유 : Harold)
- 시나리오
  - 몇 개의 task만 다른 json 파일 두 개,  
    fetch()로 업데이트 후 differ 써서 다른 object들 고르고, diff찾아서 alert 띄우기
- 

(보류)

## iOS13 부터 사용가능한 Swift 제공 Diffing