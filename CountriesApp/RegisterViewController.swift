//
//  RegisterViewController.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 14.09.24.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func newUserAdded(newUsers: [User])
}

class RegisterViewController: UIViewController {
    var errors: [String] = []
    var users: [User] = []
    var callback: (([User]) -> Void)?
    var registerInfo: [User] = []
    weak var delegate: RegisterViewControllerDelegate!
    
    @IBOutlet private weak var registerUsername: UITextField!
    @IBOutlet private weak var registerEmail: UITextField!
    @IBOutlet private weak var registerNumber: UITextField!
    @IBOutlet private weak var registerPassword: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        registerPassword.isSecureTextEntry = true
        buttonConfigure(registerButton)
        errorLabel.isHidden = true
    }
    
    func setUserList(list: [User]) {
        self.users = list
    }
    
    private func buttonConfigure(_ button: UIButton!) {
        button!.layer.cornerRadius = 4
    }
    
    @IBAction private func userRegistration(_ sender: UIButton) {
        errors = []
        if isValidNum(registerNumber) && isValidEmail(registerEmail) && isUsernameEntered(registerUsername) && isPasswordEntered(registerPassword){
            let newUser = User(username: registerUsername.text!, email: registerEmail.text!, number: registerNumber.text!, password: registerPassword.text!)
            registerInfo = [newUser]
            callback?(registerInfo)
            users.append(newUser)
            delegate?.newUserAdded(newUsers: users)
            registerEmail.text = ""
            registerUsername.text = ""
            registerNumber.text = ""
            registerPassword.text = ""
            navigationController?.popViewController(animated: true)
        } else {
            if !isValidNum(registerNumber){
                errors.append("number")
                errorBorderOn(registerNumber)
            } else {
                errorBorderOff(registerNumber)
            }
            if !isValidEmail(registerEmail) {
                errors.append("email")
                errorBorderOn(registerEmail)
            } else {
                errorBorderOff(registerEmail)
            }
            if !isUsernameEntered(registerUsername) {
                errors.append("username")
                errorBorderOn(registerUsername)
            } else {
                errorBorderOff(registerUsername)
            }
            if !isPasswordEntered(registerPassword) {
                errors.append("password")
                errorBorderOn(registerPassword)
            } else {
                errorBorderOff(registerPassword)
            }
        }
        if errors.count != 0 {
            errorShow(list: errors)
        }
    }
    
    private func errorShow(list: [String]) {
        errorLabel.text = "Enter valid " + errors[0]
        for label in errors[1..<errors.count] {
            errorLabel.text! = errorLabel.text! + ", " + label
        }
        errorLabel.isHidden = false
    }
    
    private func errorBorderOn(_ textfield: UITextField) {
        textfield.layer.borderColor = UIColor(.red).cgColor
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = 4
    }
    
    private func errorBorderOff(_ textfield: UITextField) {
        textfield.layer.borderWidth = 0
    }
    
    private func isValidEmail(_ email: UITextField) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email.text!)
    }
    
    private func isValidNum(_ number: UITextField) -> Bool {
        let numRegEx = "^(050|055|010|077|051)\\d{7}$"
        let numPred = NSPredicate(format: "SELF MATCHES %@", numRegEx)
        return numPred.evaluate(with: number.text!)
    }
    
    private func isUsernameEntered(_ uname: UITextField) -> Bool {
        return uname.text!.count >= 3
    }
    
    private func isPasswordEntered(_ password: UITextField) -> Bool {
        return password.text!.count >= 6
    }
}
