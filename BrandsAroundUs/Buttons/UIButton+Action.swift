//
//  UIButton+Action.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit
public extension UIButton {
    private func actionHandler(action:(() -> Void)? = nil) {
        struct Action {
            static var action :(() -> Void)?
        }
        if let ctaAction = action {
            Action.action = ctaAction
        } else {
            Action.action?()
        }
    }
    @objc private func triggerActionHandler() {
        self.actionHandler()
    }
    func actionHandler(controlEvents control: UIControl.Event, forAction action:@escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}
