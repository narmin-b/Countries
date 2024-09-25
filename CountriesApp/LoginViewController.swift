//
//  LoginViewController.swift
//  CountriesApp
//
//  Created by Narmin Baghirova on 14.09.24.
//

import UIKit
 


class LoginViewController: UIViewController {
    var users: [User] = [User(email: "aha", password: "123456")]
    var registerController: RegisterViewController?
    var registerInfo: [User] = []
    
    @IBOutlet private weak var loginImage: UIImageView!
    @IBOutlet private weak var loginEmail: UITextField!
    @IBOutlet private weak var loginPassword: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var loginError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        registerButton.layer.cornerRadius = 4
        loginError.isHidden = true
        loginImage.image = UIImage(named: "logo")
        loginImage.contentMode = .scaleAspectFill
        loginPassword.isSecureTextEntry = true
        

        registerController = UIStoryboard.init(name: "Register", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        registerController?.delegate = self
        registerController?.setUserList(list: users)
        registerController?.callback = { [weak self] info in
            self?.registerInfo = info
            self?.loginEmail.text = self?.registerInfo[0].email
            self?.loginPassword.text = self?.registerInfo[0].password
        }
        
    }
    
    @IBAction private func registerButtonClicked(_ sender: UIButton) {
        if let registerController = registerController {
            navigationController?.pushViewController(registerController, animated: true)
        }
    }
    
    @IBAction private func loginButtonClicked(_ sender: UIButton) {
        guard loginEmail.text! == "" else {
            if isUserExisting(email: loginEmail.text!) {
                if isUserValid(email: loginEmail.text!, password: loginPassword.text!) {
                    loginError.isHidden = true
                    loginEmail.text = ""
                    loginPassword.text = ""
                    navigationController?.pushViewController(UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryViewController") as! CountryViewController, animated: true)
                    errorBorderOff(loginPassword)
                    errorBorderOff(loginEmail)
                } else {
                    loginError.text = "Wrong password"
                    loginError.isHidden = false
                    errorBorderOn(loginPassword)
                    errorBorderOff(loginEmail)
                    return
                }
            } else {
                loginError.text = "User does not exist"
                loginError.isHidden = false
                errorBorderOn(loginEmail)
                errorBorderOn(loginPassword)
            }
            return
        }
    }
    
    private func isUserValid(email: String, password: String) -> Bool {
        return users.contains(where: { $0.email == email && $0.password == password })
    }
    
    private func isUserExisting(email: String) -> Bool {
        return users.contains(where: { $0.email == email })
    }
    
    private func errorBorderOn(_ textfield: UITextField) {
        textfield.layer.borderColor = UIColor(.red).cgColor
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = 4
    }
    
    private func errorBorderOff(_ textfield: UITextField) {
        textfield.layer.borderWidth = 0
    }
}

extension LoginViewController: RegisterViewControllerDelegate {
    func newUserAdded(newUsers: [User]) {
        users = newUsers
    }
}
