//
//  AlertPresenter.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

public protocol AlertPresenter {
    func showAlert(_ title: String, message: String, okButtonTitle: String, okAction: ((UIAlertAction) -> Swift.Void)?, cancelButtonTitle: String?, cancelAction: ((UIAlertAction) -> Swift.Void)?)
    func showError(_ title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)?)
    func showError(_ title: String, message: String)
    func showError(_ error: Error?)
    func showMessage(_ title: String, message: String)
    func showMessage(_ title: String, message: String, handler:(@escaping (UIAlertAction) -> Swift.Void))
    func showCustomAlert(titleImage: UIImage?, title: String, message: String, okButtonText: String, cancelButtonText: String, okButtonAction: VoidClosure?, cancelAction: VoidClosure?)
}

public extension AlertPresenter where Self: UIViewController {

    func showAlert(_ title: String = "", message: String, okButtonTitle: String =  "Ok", okAction: ((UIAlertAction) -> Swift.Void)? = nil, cancelButtonTitle: String? = nil, cancelAction: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //We can uncomment the below lines when we have the font for UIAlert
        /*
        let titleAttrString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: APPStyle.Font.navigationBarFont!])
        let messageAttrString = NSMutableAttributedString(string: message, attributes: [NSAttributedString.Key.font: APP.,3456789 vStyle.Font.paragraph!])
        alertVC.setValue(titleAttrString, forKey: "attributedTitle")
        alertVC.setValue(messageAttrString, forKey: "attributedMessage")
         */
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAlertAction: UIAlertAction = UIAlertAction(title: cancelButtonTitle, style: .default, handler: cancelAction)
            cancelAlertAction.setValue(UIColor.black, forKey: "titleTextColor")
            alertVC.addAction(cancelAlertAction)
        }
        alertVC.addAction(UIAlertAction(title: okButtonTitle, style: .default, handler: okAction))
        present(alertVC, animated: true)
    }

    func showError(_ title: String = "Error", message: String, handler: ((UIAlertAction) -> Swift.Void)?) {
        showAlert(title, message: message, okAction: handler)
    }

    func showError(_ title: String = "Error", message: String) {
        showError(title, message: message, handler: nil)
    }

    func showError(_ error: Error?) {
        if let error = error as NSError? {
            self.showError(message: error.localizedDescription)
        }
    }

    func showMessage(_ title: String, message: String) {
        showAlert(title, message: message, okAction: nil)
    }

    func showMessage(_ title: String, message: String, handler:(@escaping (UIAlertAction) -> Swift.Void)) {
        showAlert(title, message: message, okAction: handler)
    }
        
    func showCustomAlert(titleImage: UIImage? = nil, title: String = "", message: String = "", okButtonText: String = "Ok", cancelButtonText: String = "", okButtonAction: VoidClosure? = nil, cancelAction: VoidClosure? = nil) {

        let alertViewController = AlertViewController(title: title, description: message, okButtonText: okButtonText, cancelButtonText: cancelButtonText, okAction: {
            //            [weak self] in
            //            guard let weakSelf = self else { return }
            //            weakSelf.dismiss(animated: true, completion: nil)
            if let action = okButtonAction {
                action()
            }
        }, cancelAction: {
            //            [weak self] in
            //            guard let weakSelf = self else { return }
            //            weakSelf.dismiss(animated: true, completion: nil)
            if let action = cancelAction {
                action()
            }
        }, titleImage: titleImage)
        alertViewController.providesPresentationContextTransitionStyle = true
        alertViewController.definesPresentationContext = true
        alertViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(alertViewController, animated: true, completion: nil)
    }
}
