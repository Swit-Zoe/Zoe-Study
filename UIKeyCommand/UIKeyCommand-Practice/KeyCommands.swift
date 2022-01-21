//
//  KeyCommands.swift
//  UIKeyCommand-Practice
//
//  Created by Zoe on 2022/01/20.
//

import Foundation
import UIKit

enum KeyCommands: String, CaseIterable {
    
    case reactLastMessage = "reactLastMessage"
    case editLastMessage = "editLastMessage"
    case showPrevList = "showPrevList"
    case showNextList = "showNextList"
    case basicSetting = "basicSetting"
    case toggleSideMenu = "toggleSideMenu"
    case search = "search"
    case search2 = "search2"
    case channelInfo = "channelInfo"
    case quickSwitcher = "quickSwitcher"
    case newDirectMessage = "newDirectMessage"
    case showMention = "showMention"
    case showWriteModal = "showWriteModal"
    case showFavoriteList = "showFavoriteList"
    case showThread = "showThread"
    case quickSwitcher2 = "quickSwitcher2"
    case close = "close"
    case showEditingStatus = "showEditingStatus"
    case confirm = "confirm"
    case newLine = "newLine"
    case tabRight = "tabRight"
    case tabLeft = "tabLeft"
    case bold = "bold"
    case italic = "italic"
    case strike = "strike"
    
    var command: UIKeyCommand {
        switch self {
        case .reactLastMessage:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "/",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "마지막 메시지에 반응",
                                attributes: [], state: .on)
        case .editLastMessage:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: UIKeyCommand.inputUpArrow,
                                modifierFlags: [],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "마지막 메시지 편집",
                                attributes: [], state: .on)
        case .showPrevList:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "[",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "내역으로 돌아가기",
                                attributes: [], state: .on)
        case .showNextList:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "]",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "내역에서 앞으로 가기",
                                attributes: [], state: .on)
        case .basicSetting:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: ",",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "기본 설정 표시",
                                attributes: [], state: .on)
        case .toggleSideMenu:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: UIKeyCommand.inputEscape,
                                modifierFlags: [.alphaShift],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "사이드 메뉴 열기/닫기",
                                attributes: [], state: .on)
        case .search:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "F",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "검색",
                                attributes: [], state: .on)
        case .search2:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "G",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "검색",
                                attributes: [], state: .on)
        case .channelInfo:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "I",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "채널 정보",
                                attributes: [], state: .on)
        case .quickSwitcher:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "K",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "퀵 스위처 표시",
                                attributes: [], state: .on)
        case .newDirectMessage:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "K",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "새 다이렉트 메시지",
                                attributes: [], state: .on)
        case .showMention:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "M",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "멘션 표시",
                                attributes: [], state: .on)
        case .showWriteModal:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "N",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "작성 표시",
                                attributes: [], state: .on)
        case .showFavoriteList:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "S",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "즐겨찾기에 추가한 항목 표시",
                                attributes: [], state: .on)
        case .showThread:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "T",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "스레드 보기 열기",
                                attributes: [], state: .on)
        case .quickSwitcher2:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "T",
                                modifierFlags: [],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "퀵 스위처 표시",
                                attributes: [], state: .on)
        case .close:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "W",
                                modifierFlags: .command,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "닫기",
                                attributes: [], state: .on)
        case .showEditingStatus:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "Y",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "상태 편집 보기 표시",
                                attributes: [], state: .on)
        case .confirm:
            return UIKeyCommand(title: self.rawValue,
                                image: UIImage(systemName: "return"),
                                action: #selector(ViewController.dummySelector),
                                input: "\r",
                                modifierFlags: [],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "선택 수락 / 제출 입력",
                                attributes: [], state: .on)
        case .newLine:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "\r",
                                modifierFlags: .shift,
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "새 줄 추가",
                                attributes: [], state: .on)
        case .tabRight:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "\t",
                                modifierFlags: [],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "선을 1로 들여쓰기",
                                attributes: [], state: .on)
        case .tabLeft:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: UIKeyCommand.f1,
                                modifierFlags: [],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "선을 1로 내어쓰기",
                                attributes: [], state: .on)
        case .bold:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "B",
                                modifierFlags: [.command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "텍스트 굵게",
                                attributes: [], state: .on)
        case .italic:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "I",
                                modifierFlags: [.command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "기울임꼴로 표시한 텍스트",
                                attributes: [], state: .on)
        case .strike:
            return UIKeyCommand(title: self.rawValue, action: #selector(ViewController.dummySelector),
                                input: "X",
                                modifierFlags: [.shift, .command],
                                propertyList: [], alternates: [],
                                discoverabilityTitle: "텍스트에 취소선 표시",
                                attributes: [], state: .on)
        }
    }
}
