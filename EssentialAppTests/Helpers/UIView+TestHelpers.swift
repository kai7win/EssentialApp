//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Kai Chi Tsao on 2023/4/20.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
