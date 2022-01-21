# UIKeyCommand

### Table of Contents

[UIKeyCommand 추가하기](#UIKeyCommand-추가하기)

[Initializer](#Initializer)

[궁금했던 것들](#궁금했던-것들-참고사항)

[연습 프로젝트](#연습-프로젝트)

## Docs

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uikeycommand)

## UIKeyCommand 추가하기

모든 `UIResponder` 클래스는 `keyCommands` 의 배열 변수.  
이걸 override해서 원하는 UIKeyCommands를 제공할 수 있음.
( stored property로 바뀌어서, add, remove 메소드를 사용해야 함.)

![Untitled](https://user-images.githubusercontent.com/97005335/150451061-09aa4f79-6e18-4d0c-809d-3ca76c1595be.png)

이런식으로 만들 수 있는데, 만들고 나서 실제로 동작하게 하기 위해서는  
responder chain에 우리 뷰가 first responder가 될 수 있다고 알려주는게 좋음.

```swift
override var canBecomeFirstResponder: Bool {
    return true
}
```

- It’s good to know that the system is always checked first for the pressed key commands. The system will stop your shortcut from working if it has a shortcut assigned to the combination. For other key commands, the responder chain is used to find the first object that implements a key command for the pressed keys.

## Initializer

**Declaration**

```swift
@MainActor convenience init(title: String = "", 
                            image: UIImage? = nil, 
                            action: Selector, 
                            input: String, 
                            modifierFlags: UIKeyModifierFlags = [], 
                            propertyList: Any? = nil, 
                            alternates: [UICommandAlternate] = [], 
                            discoverabilityTitle: String? = nil, 
                            attributes: UIMenuElement.Attributes = [], 
                            state: UIMenuElement.State = .off)
```

### Title

“” 상태이면 HUD에서는 `No Title`로 표시됨.

### Image

key command의 title 옆에 띄울 이미지.

### Action

해당 단축키를 누르면 실행할 Selector 함수.

### Input

단축키로 설정할 key들.   
[Docs](https://developer.apple.com/documentation/uikit/uikeycommand/input_strings_for_special_keys)에 텍스트로 입력된 문자열을 단축키로 인식할 수 있는 special key들 목록이 있다.  
Special key들은 아래와 같이 사용하면 된다.

```swift
private func initKeyCommands() {
        addKeyCommand(UIKeyCommand(input: UIKeyCommand.inputEscape,
```

( Esc, Delete, F1~F12, 상하좌우 방향키, Home, End, PageUp, PageDown 키)

<aside>
💡 엔터는 "\n”를 입력해야 HUD에 return sf symbol이 뜬다. 탭은 "\t”

</aside>

### ModifierFlags

여기서 key 조합을 정의한다. input으로 정한 키와 같이 눌러야 하는 키들을 설정한다.  
(예를들어 command, option, shift ...) 전체 목록은 [Docs](https://developer.apple.com/documentation/uikit/uikeymodifierflags)에 있다.

- Caps Lock (.alphaShift)
- Shift (.shift)
- Control (.control)
- Option (.alternate)
- Command (.command)
- 숫자 키 (.numericPad)

### PropertyList: Any?

key command와 결합해 사용될 데이터를 포함하고 있는 객체.
보통 필요 시 command를 구별하기 위해 property list object를 사용하는 듯!

### Altenates: [UICommandAlternate]

필요 시, modifier flag가 다른 대체 command로 바꾼다.  
key command의 대체 키의 배열.

사용자들에게 command에 대한 대체 action을 제공하고 싶을 때 사용한다.  
사용자가 키보드의 modifier key를 long press하고 있을 때 사용 가능하다.  
(메뉴 시스템 사용 시에만 나타나는 것 같다. HUD(X) )

### DiscoverablityTitle

command key를 long press했을 때 나오는 dialog**(heads-up display (HUD)**)에 표시될 커맨드의 설명.  
이 프로퍼티가 nil이면 대신 title을 표시함.

### Attributes

![Untitled 1](https://user-images.githubusercontent.com/97005335/150451097-84e2289e-bd47-4965-afee-7efb0fbb5d9d.png)

`.destructive`, `.disabled`, `.hidden` 

이미지 참고!
HUD에서는 disabled, hidden 을 적용하면  
리스트에서 사라진다.

### State

![Untitled 2](https://user-images.githubusercontent.com/97005335/150451129-1460727b-8c26-49a1-adcd-81ae64206978.png)

`.off`, `.on`, `.mixed` 

이미지 참고. on 상태일때는 저렇게 
왼쪽에 체크 표시가 되어있다고 한다.

## 궁금했던 것들, 참고사항

- init 매개변수 중 title이랑 image는 뭘 위해 쓰는건지
  
  - `init(input:modifierFlags:action:discoverabilityTitle:)`
    was deprecated in iOS 13.0
  - title이랑 image가 이젠 Required 상태인 듯..
  - **title** → `DiscoverablityTitle`이 optional이니까, title을 필수로 지정하게 해서  
    `DiscoverablityTitle`가 nil일 때 HUD에 title을 표시하기 위함인 듯.  
    `DiscoverablityTitle`가 nil이 아니면 HUD에 `DiscoverablityTitle`이 표시되므로..
  - **image** → iOS에서만, UIMenuSystem의 context 메뉴 시스템 상태일 때만
    key command의 title 옆에 이미지가 뜸.

- 여러 키 조합해서 사용하는 법 (ex: shift, command, X ...)
  
  - `modifierFlags: [.shift, .alternate],` 배열로 작성

- OS 단축키 (F1: 밝기조정 등) override 가능한가?
  
  - Apple-reserved shortcuts, 또는 command+C 같은 것들이 우선순위가 더 높아서  
    override할 수 없는 것 같다.

- 슬랙 개행, 메세지 전송 로직 따라해보기
  
  ```swift
  // MARK: - KeyCommandActionProtocol
  
  extension ViewController: KeyCommandActionProtocol {
      func pressEnter() {
          testLabel.text = textView.text
          textView.text = ""
      }
  
      func pressNewLine() {
          textView.insertText("\n")
      }
  }
  ```

- 슬랙 HUD 캡쳐  ![IMG_152F3E73A7EA-2](https://user-images.githubusercontent.com/97005335/150451158-86308d26-eae1-4437-a385-6b38a9a43193.jpeg)
  ![IMG_CEA05FADC820-1](https://user-images.githubusercontent.com/97005335/150451165-19c88c6e-5e62-4e3e-83af-9ad82d54f582.jpeg)

- 키보드 단축키로 뷰 네비게이팅도 가능! [Docs](https://developer.apple.com/documentation/uikit/uikeycommand/navigating_an_app_s_user_interface_using_a_keyboard)



### 연습 프로젝트

![RPReplay_Final1642730216](https://user-images.githubusercontent.com/97005335/150452069-10319632-e6b5-492c-a700-84e3d7db19d8.gif)


![RPReplay_Final1642730240](https://user-images.githubusercontent.com/97005335/150452072-4b89fec4-7c99-4873-aac6-27f154bed3e4.gif)
