# Diff

Created: January 21, 2022 1:21 PM

## Diff가 뭔지

[Ordered Collection Diffing](https://thoughtbot.com/blog/ordered-collection-diffing?utm_campaign=iOS%2BDev%2BWeekly&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B405)

## 라이브러리 종류 및 비교

[Diff-Libraries.md](https://github.com/Swit-Zoe/Zoe-Study/blob/main/Diff/Diff-Libraries.md)

## 연습 프로젝트 설명 - table view

`diff = old.extendedDiff(new)` 로 ExtendedDiff를 만들어준 후 출력해보면

```
ExtendedDiff(source: Differ.Diff(
elements: [I(1), I(3), I(5), I(6), D(4), D(5), D(6), D(7), D(8), D(9), D(10), I(8), I(9), I(10)]), 
sourceIndex: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 
reorderedIndex: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 
elements: [I(1), I(3), I(5), I(6), D(4), D(5), D(6), D(7), D(8), D(9), D(10), I(8), I(9), I(10)], 
moveIndices: Set([]))
```

가 출력되는데, 여기서 elements가 

`I(1), I(3), I(5), I(6), D(4), D(5), D(6), D(7), D(8), D(9), D(10), I(8), I(9), I(10)`

이런 식이다. 라이브러리의 Elements는 Enum으로 만들어져 있는데, 아래와 같다.

```swift
public enum Element {
    case insert(at: Int)
    case delete(at: Int)
    case move(from: Int, to: Int)
}
```

즉, 위의 I(1) 은 index 1번에 insert 라는 뜻이다.

---

![image](https://user-images.githubusercontent.com/97005335/151126792-fab22a46-c0ae-4e5c-834a-e27484d4e2cf.png)

테스트 데이터를 보면 1, 3, 5, 6, 8, 9, 10 번째 index의 cell data가 수정된 것을 볼 수 있다.

Diff는 old row : new row = 1:1 매칭이 아닌,  
기존과 같은 data는 그대로 놔두고  필요한 cell들은 사이사이 insert, 필요 없어진 cell들은 delete한다.

그러나 우리가 필요한 건 각 row 내 data가 업데이트 된 cell의 목록이므로,

```swift
print("updated된 cell들 전체 출력")
diff.elements.forEach { element in
    if case let .insert(at) = element {
        print(at)
        self.testTableView.selectRow(at: IndexPath(row: at, section: 0), animated: true, scrollPosition: .top)
    }
}
print("--------------------")
```

diff의 elements들 중에서 case가 insert에 해당하는 element들의 연관값만을 뽑아 사용한다.

## 연습 프로젝트 시연

![image](https://user-images.githubusercontent.com/97005335/151128583-85a9000a-e59b-4079-b5bd-09e5837ca459.png) 버튼으로 데이터를 toggle하고,
![image](https://user-images.githubusercontent.com/97005335/151128600-7736a760-4ee2-489e-85d1-5551d86c46c8.png) 버튼으로 변경된 데이터를 multi-select한다.

<img src ="https://user-images.githubusercontent.com/97005335/151128402-83261587-e214-41be-8377-d99e99fbf789.gif" width=300 >