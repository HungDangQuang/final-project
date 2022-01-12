//
//  AuthenticationViewController.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Jan/2022.
//

import UIKit
import CoreData
import FirebaseDatabase

class AuthenticationViewController: UIViewController {
    
    private let database = Database.database().reference()

    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "fb")
        return iv
    }()
    
    lazy var userIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.image = UIImage(named: "usr1")
        return icon
    }()
    
    lazy var usernameTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = "Username"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        
        return textField
    }()
    
    lazy var usernameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.userIcon,self.usernameTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // pwd
    
    lazy var pwdIcon: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        icon.image = UIImage(named: "pwd1")
        return icon
    }()
    
    lazy var pwdTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        
        return textField
    }()
    
    lazy var pwdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.pwdIcon,self.pwdTextField].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    lazy var loginFromStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.usernameStackView,self.pwdStackView].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    lazy var loginButton: customButton = {
       let btn = customButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(withTitle: "Login")
        btn.backgroundColor = hexStringToUIColor(hex: "#EF6C10")
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    var authenticationViewModel: AuthenticationViewModel!
    
    lazy var synButton: customButton = {
        let btn = customButton()
         btn.translatesAutoresizingMaskIntoConstraints = false
         btn.setTitle(withTitle: "Synchronize")
         btn.backgroundColor = hexStringToUIColor(hex: "#EF6C10")
         btn.layer.cornerRadius = 15
         return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
//        configureLogo()
//        configureUsernameStackView()
//        configurePwdStackView()
//        configureLoginButton()
//        configuresSynButton()
        
        authenticationViewModel = AuthenticationViewModel()
        let ref = Database.database().reference()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let arr = try managedContext.fetch(CustomButton.fetchRequest())
            var count = 1
            ref.child(UIDevice.current.identifierForVendor!.uuidString).removeValue()
            for element in arr {
                let buttonRef = ref.child(UIDevice.current.identifierForVendor!.uuidString).child("Button\(count)")
                count += 1
                let object : [String : Any] = [
                    "buttonText" : element.button_text,
                    "buttonTextColor" : element.button_text_color,
                    "buttonBackgroundColor" : element.button_background_color,
                    "buttonWidth" : element.button_width,
                    "buttonHeight": element.button_height,
                    "border": element.border,
                    "borderDashPattern" : element.border_dash_pattern,
                    "borderColor" : element.border_color,
                    "borderRadius" : element.border_radius,
                    "leftIcon" : element.left_icon,
                    "rightIcon" : element.right_icon
                ]
                buttonRef.setValue(object)
            }
        }
        catch {
            print("Could not fetch data")
        }
    }
    
    func configureLogo(){
        self.view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func configureUsernameStackView(){
        self.view.addSubview(usernameStackView)
        NSLayoutConstraint.activate([
            usernameStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            usernameStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameStackView.widthAnchor.constraint(equalToConstant: 200),
            usernameTextField.widthAnchor.constraint(equalToConstant: 150),
            usernameTextField.heightAnchor.constraint(equalTo: usernameStackView.heightAnchor),
            userIcon.heightAnchor.constraint(equalTo: usernameStackView.heightAnchor),
            usernameStackView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configurePwdStackView(){
        self.view.addSubview(pwdStackView)
        NSLayoutConstraint.activate([
            pwdStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pwdStackView.topAnchor.constraint(equalTo: usernameStackView.bottomAnchor, constant: 50),
            pwdStackView.widthAnchor.constraint(equalToConstant: 200),
            pwdTextField.widthAnchor.constraint(equalToConstant: 150),
            pwdTextField.heightAnchor.constraint(equalTo: pwdStackView.heightAnchor),
            pwdIcon.heightAnchor.constraint(equalTo: pwdStackView.heightAnchor),
            pwdStackView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configureLoginButton(){
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: pwdStackView.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 35),
        ])
        let tap = UITapGestureRecognizer(target: self, action: #selector(login))
        loginButton.addGestureRecognizer(tap)
    }
    
    func configuresSynButton(){
        self.view.addSubview(synButton)
        NSLayoutConstraint.activate([
            synButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            synButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            synButton.widthAnchor.constraint(equalToConstant: 200),
            synButton.heightAnchor.constraint(equalToConstant: 35),
        ])
        self.synButton.alpha = 0
    }
    
    @objc func login(){
        loginButton.showAnimation {
            
            if self.usernameTextField.text?.isEmpty == true || self.pwdTextField.text?.isEmpty == true {
                let notification = UIAlertController(title: "Nofication", message: "Email or Password must not be empty", preferredStyle: .alert)
                notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(notification, animated: true, completion: nil)
                return
            }
            
            if self.isValidEmail(self.usernameTextField.text!) == false {
                let notification = UIAlertController(title: "Error", message: "Email is not valid", preferredStyle: .alert)
                notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(notification, animated: true, completion: nil)
                return
            }
    
            self.authenticationViewModel.authenticateUser(email: self.usernameTextField.text!, password: self.pwdTextField.text!) { stt, msg in
               
                if stt == 1 {
                    
                    self.pwdStackView.alpha = 0
                    self.usernameStackView.alpha = 0
                    self.loginButton.alpha = 0
                    self.synButton.alpha = 1
                    let notification = UIAlertController(title: "Nofication", message: msg, preferredStyle: .alert)
                    notification.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(notification, animated: true, completion: nil)
                    return
                }
                
                else {
                    let notification = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                    notification.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
                    self.present(notification, animated: true)
                    return
                }
            }
            
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isEmpty(_ input: String) -> Bool {
        if input.isEmpty == true {
            return true
        }
        return false
    }
}
