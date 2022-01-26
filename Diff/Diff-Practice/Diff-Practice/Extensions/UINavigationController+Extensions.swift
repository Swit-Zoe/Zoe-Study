//
//  UINavigationController+Extensions.swift
//  Diff-Practice
//
//  Created by Zoe on 2022/01/26.
//

import Foundation
import UIKit

extension UINavigationController {
    func initRefreshButton(navigationItem: UINavigationItem?, doneButtonClosure: Selector) {
        
        // Button
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self.topViewController, action: doneButtonClosure)
        navigationItem?.rightBarButtonItem = refreshButton
    }
    
    func initBarButtons(navigationItem: UINavigationItem?, buttons: [UIBarButtonItem]) {
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 16
        buttons.forEach { buttons in
            navigationItem?.rightBarButtonItems?.append(buttons)
            navigationItem?.rightBarButtonItems?.append(spacing)
        }
        navigationItem?.rightBarButtonItems?.removeLast()
    }
}
