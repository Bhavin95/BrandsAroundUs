//
//  RegisterView.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class RegisterView: UIViewController, AlertPresenter {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var viewFooter: UIView!
    
    @IBOutlet var cellFirstName: UITableViewCell!
    @IBOutlet weak var textFieldFirstName: CustomUITextField!
    
    @IBOutlet var cellLastName: UITableViewCell!
    @IBOutlet weak var textFieldLastName: CustomUITextField!
    
    @IBOutlet var cellEmail: UITableViewCell!
    @IBOutlet weak var textFieldEmail: CustomUITextField!
    
    @IBOutlet var cellPassword: UITableViewCell!
    @IBOutlet weak var textFieldPassword: CustomUITextField!
    
    @IBOutlet var cellConfirmPassword: UITableViewCell!
    @IBOutlet weak var textFieldConfirmPassword: CustomUITextField!
    
    @IBOutlet var cellGender: UITableViewCell!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var buttonMale: UIButton!
    @IBOutlet weak var buttonFemale: UIButton!
    
    @IBOutlet var cellPhoneNumber: UITableViewCell!
    @IBOutlet weak var textFieldPhoneNumber: CustomUITextField!
    
    @IBOutlet weak var termsConditionsButton: UIButton!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var registerButton: UIButton!
    //MARK: Constants and Variables
    
    private var registerViewModel = RegisterViewModel()
    
    var isMaleSelected = true
    var isAgreeSelected = true
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        title = "Register"
        KeyboardManager.sharedInstance.delegate = self
        
        tableView.tableHeaderView = viewHeader
        tableView.tableFooterView = viewFooter
        self.view.backgroundColor = .black
        
        textFieldFirstName.placeHolderColor = UIColor.themeColor
        textFieldLastName.placeHolderColor = UIColor.themeColor
        textFieldEmail.placeHolderColor = UIColor.themeColor
        textFieldPassword.placeHolderColor = UIColor.themeColor
        textFieldConfirmPassword.placeHolderColor = UIColor.themeColor
        textFieldPhoneNumber.placeHolderColor = UIColor.themeColor
        
        textFieldFirstName.borderColor = UIColor.themeColor
        textFieldLastName.borderColor = UIColor.themeColor
        textFieldEmail.borderColor = UIColor.themeColor
        textFieldPassword.borderColor = UIColor.themeColor
        textFieldConfirmPassword.borderColor = UIColor.themeColor
        textFieldPhoneNumber.borderColor = UIColor.themeColor
        
        buttonMale.titleLabel?.textColor = UIColor.themeColor
        buttonFemale.titleLabel?.textColor = UIColor.themeColor
        genderLabel.textColor = UIColor.themeColor
        
        registerButton.titleLabel?.textColor = UIColor.themeColor
        termsConditionsButton.titleLabel?.textColor = UIColor.themeColor
    }
    
    //MARK: Actions
    
    @IBAction func actionSelectGender(_ sender: UIButton) {

        if isMaleSelected {
            isMaleSelected = false
            buttonMale.setImage(UIImage(named: "chky"), for: .normal)
            buttonFemale.setImage(UIImage(named: "chkn"), for: .normal)
        } else {
            isMaleSelected = true
            buttonMale.setImage(UIImage(named: "chkn"), for: .normal)
            buttonFemale.setImage(UIImage(named: "chky"), for: .normal)
        }
    }
    
    
    @IBAction func actionAgree(_ sender: UIButton) {
        isAgreeSelected = !isAgreeSelected
        if isAgreeSelected {
            sender.setImage(UIImage(named: "checked_icon"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "uncheck_icon"), for: .normal)
        }
    }
    
    @IBAction func actionRegister(_ sender: UIButton) {
        print(registerViewModel.registerModel)
        
        if let firstName = textFieldFirstName.text, firstName.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter First Name")
            return
        } else if let lastName = textFieldLastName.text, lastName.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Last Name")
            return
        } else if let email = textFieldEmail.text, email.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Your Email")
            return
        } else if !(textFieldEmail.text?.isValidEmail ?? true) {
            showCustomAlert(title: "Error", message: "Invalid Email ID")
            return
        } else if let password = textFieldPassword.text, password.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Password")
            return
        } else if let confirmPassword = textFieldConfirmPassword.text, confirmPassword.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Confirm Password")
            return
        } else if textFieldPassword.text != textFieldConfirmPassword.text {
            showCustomAlert(title: "Error", message: "Password and Confirm Password are not matched")
            return
        } else if let phoneNumber = textFieldPhoneNumber.text, phoneNumber.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Phone Number")
            return
        } else if !(textFieldPhoneNumber.text?.isIndianPhoneNumber ?? true) {
            showCustomAlert(title: "Error", message: "Invalid Phone Number")
            return
        }
    }
}

//MARK: Extensions

extension RegisterView: KeyboardManagerDelegate {
    func keyboardWillChangeFrame(endFrame: CGRect?, duration: TimeInterval, animationCurve: UIView.AnimationOptions) {
        
        guard let endFrame = endFrame else { return }
        
        if endFrame.origin.y >= UIScreen.main.bounds.size.height {
             UIView.animate(withDuration: duration) {
                self.tableViewBottomConstraint.constant = 0
            }
        } else {
            UIView.animate(withDuration: duration) {
                self.tableViewBottomConstraint.constant = endFrame.size.height
            }
        }
    }
}

extension RegisterView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case textFieldFirstName:
            textFieldLastName.becomeFirstResponder()
        case textFieldLastName:
            textFieldEmail.becomeFirstResponder()
        case textFieldEmail:
            textFieldPassword.becomeFirstResponder()
        case textFieldPassword:
            textFieldConfirmPassword.becomeFirstResponder()
        case textFieldConfirmPassword:
            textFieldConfirmPassword.resignFirstResponder()
        case textFieldPhoneNumber:
            textFieldPhoneNumber.resignFirstResponder()
        default: break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        switch textField {
        case textFieldFirstName:
            registerViewModel.registerModel.firstName = textField.text!
        case textFieldLastName:
            registerViewModel.registerModel.lastName = textField.text!
        case textFieldEmail:
            registerViewModel.registerModel.email = textField.text!
        case textFieldPassword:
            registerViewModel.registerModel.password = textField.text!
        case textFieldConfirmPassword:
            registerViewModel.registerModel.confirmPassword = textField.text!
        case textFieldPhoneNumber:
            registerViewModel.registerModel.phoneNo = textField.text!
        default:
            break
        }
        
    }
}

extension RegisterView: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cellFirstName
        case 1:
            return cellLastName
        case 2:
            return cellEmail
        case 3:
            return cellPassword
        case 4:
            return cellConfirmPassword
        case 5:
            return cellGender
        case 6:
            return cellPhoneNumber
        default:
            return UITableViewCell()
        }
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        self.view.endEditing(true)
    }
    
}

