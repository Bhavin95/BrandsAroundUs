//
//  AlertViewController.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

public typealias VoidClosure = () -> Void

class AlertViewController: UIViewController {

    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var okButton: UIButton!
    @IBOutlet private weak var containerView: UIView!

    var titleImage: UIImage?
    var titleMessage: String
    var descriptionMessage: String
    var okButtonText: String
    var cancelButtonText: String
    var okAction: VoidClosure
    var cancelAction: VoidClosure?
    var isPresenting = false
    var blurAnimator: UIViewPropertyAnimator!

    lazy var blurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView()
        blurView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.56)
        blurView.frame = view.bounds
        return blurView
    }()

    init(title: String = "", description: String = "", okButtonText: String, cancelButtonText: String, okAction: @escaping VoidClosure, cancelAction: VoidClosure? = nil, titleImage: UIImage? = nil) {
        self.titleImage = titleImage
        self.titleMessage = title
        self.descriptionMessage = description
        self.okAction = okAction
        self.cancelAction = cancelAction
        self.okButtonText = okButtonText
        self.cancelButtonText = cancelButtonText
        super.init(nibName: "AlertViewController", bundle: Bundle(identifier: "Brands.21EventAndTech.BrandsAroundUs"))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .custom
        transitioningDelegate = self
        titleImageView.layer.cornerRadius = 20.0
    }
    
    private func configureTitleImageView() {
        titleImageView.image = titleImage
        titleImageView.isHidden = (titleImage == nil)
    }
    
    private func configureTitleMessage() {
        titleLabel.text = titleMessage
        titleLabel.isHidden = titleMessage.isEmpty
    }
    
    private func configureDescriptionMessage() {
        if descriptionMessage.isEmpty {
            descriptionLabel.isHidden = true
            titleLabel.textColor = .white
            titleLabel.font = APPStyle.Font.headlineH4Bold
            return
        }
        descriptionLabel.text = descriptionMessage
    }

    private func configureBlurView() {
        containerView.addSubview(blurView)
        blurAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .linear) { [blurView] in
            blurView.effect = UIBlurEffect(style: .dark)
        }
        blurAnimator.fractionComplete = 0.15
    }
    
    private func animateContainer() {
        alertView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {() -> Void in
            self.alertView.transform = .identity
        }, completion: nil )
    }
    
    private func dismissAlertWithAnimation(dismissAction: @escaping VoidClosure) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {() -> Void in
            self.alertView.alpha = 0
            self.blurView.alpha = 0
        }, completion: { (success) in
            if success {
                self.blurAnimator.stopAnimation(true)
                self.blurView.removeFromSuperview()
                self.dismiss(animated: true, completion: {
                    dismissAction()
                })
            }
        })
    }
    
    fileprivate func configureCancelButton() {
        cancelButton.backgroundColor = .clear
        cancelButton.setTitleColor(.white, for: .normal)
        if cancelButtonText.isEmpty {
            cancelButton?.isHidden = true
            let widthConstraint = NSLayoutConstraint(
                item: okButton!,
                attribute: .width,
                relatedBy: .greaterThanOrEqual,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: 150
            )
            widthConstraint.isActive = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateContainer()
        okButton?.setTitle(okButtonText, for: .normal)
        cancelButton?.setTitle(cancelButtonText, for: .normal)
        alertView.layer.cornerRadius = 8.0
        configureBlurView()
        configureTitleImageView()
        configureTitleMessage()
        configureDescriptionMessage()
        configureCancelButton()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        if let action = cancelAction {
            dismissAlertWithAnimation {
                action()
            }
        } else {
            dismissAlertWithAnimation { }
        }
    }
    
    @IBAction func okButtonTapped(_ sender: Any) {
        dismissAlertWithAnimation {
            self.okAction()
        }
    }
}

extension AlertViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresenting.toggle()
//        if isPresenting {
//            self.blurView.alpha = 1
//            self.alertView.alpha = 1
//        } else {
//            self.blurView.alpha = 0
//            self.alertView.alpha = 0
//        }
        
        transitionContext.completeTransition(true)
    }
}
