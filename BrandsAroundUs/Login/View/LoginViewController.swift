//
//  LoginViewController.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/12/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , AlertPresenter{

    @IBOutlet private weak var brandsAroundUsTitleLabel: UILabel!
    @IBOutlet private weak var userNameTextField: CustomUITextField!
    @IBOutlet private weak var passwordTextField: CustomUITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var forgotPasswordButton: UIButton!
    @IBOutlet private weak var dontHaveAccountLabel: UILabel!
    @IBOutlet private weak var addAccountLabel: UIButton!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        brandsAroundUsTitleLabel.textColor = UIColor.themeColor
        loginButton.titleLabel?.textColor = UIColor.themeColor
        forgotPasswordButton.titleLabel?.textColor = UIColor.themeColor
        dontHaveAccountLabel.textColor = UIColor.themeColor
        addAccountLabel.titleLabel?.textColor = UIColor.themeColor
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        if let username = userNameTextField.text, username.isEmpty {
            showCustomAlert(titleImage: UIImage(named: "BrandOPediaIcon"), title: "Error", message: "Please Enter username")
            return
        } else if let password = passwordTextField.text, password.isEmpty {
            showCustomAlert(title: "Error", message: "Please Enter Password")
            return
        }
        
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
    }
    
    @IBAction func addAccountAction(_ sender: UIButton) {
        
        let registerView = RegisterView()
        navigationController?.pushViewController(registerView, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: UITextFieldDelegate {
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case userNameTextField:
            loginViewModel.loginModel.userName = textField.text!
        case passwordTextField:
            loginViewModel.loginModel.password = textField.text!
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            return passwordTextField.becomeFirstResponder()
        case passwordTextField:
             return passwordTextField.resignFirstResponder()
        default: return true
        }
    }
}
