//
//  BorderDropDown.swift
//  finalProject
//
//  Created by QUANG HUNG on 28/Dec/2021.
//

import Foundation
import UIKit

protocol updateUI{
    func updateUI()
}

class BorderDropDownBtn: customButton, dropDownProtocol {
    
    var textfield = TextFieldWithPadding()
    var updateBorderDelegate: updateButtonProtocol!
    func dropDownPressed(string: String) {
        self.setTitle(withTitle: string)
        if string == "No" {
            option.alpha = 0
            textfield.alpha = 0
            textfield.text = nil
        }
        else {
            option.alpha = 1
            textfield.alpha = 1
        }
        updateUIDelegate?.updateUI()
        updateBorderDelegate.update()
        changeDropDownOption()
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    var option = OptionDropDownBtn()
    
    var updateUIDelegate:updateUI?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        dropView = dropDownView.init(frame: .zero)
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
        configureTextfield()
        configDropDownOption()
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
        
        self.superview?.addSubview(option)
        self.superview?.bringSubviewToFront(option)
        option.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        option.leadingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        option.widthAnchor.constraint(equalToConstant: 120).isActive = true
        option.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        self.superview?.addSubview(textfield)
        self.superview?.bringSubviewToFront(textfield)
        textfield.leadingAnchor.constraint(equalTo: option.trailingAnchor).isActive = true
        textfield.topAnchor.constraint(equalTo: option.topAnchor).isActive = true
        textfield.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textfield.heightAnchor.constraint(equalTo: option.heightAnchor).isActive = true
//        option.alpha = 0
       
    }
    
    func configureTextfield(){
        textfield.borderStyle = .line
        textfield.placeholder = "Border"
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = hexStringToCGColor(hex: "#DADADA")
    }

    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func configDropDownOption(){
        dropView.dropDownOptions = ["Yes"]
        option.setTitle(withTitle: "Solid")
    }
    
    func changeDropDownOption(){
        
        if self.title.text! == "Yes" {
            dropView.dropDownOptions = ["No"]
            
        }
        else {
            dropView.dropDownOptions = ["Yes"]
        }
        dropView.tableView.reloadData()
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OptionDropDownBtn: customButton, dropDownProtocol {
    
    var updateUIDelegate: updateUI?
    
    func dropDownPressed(string: String) {
        self.setTitle(withTitle: string)
//        updateUIDelegate?.updateUI()
        changeDropDownOption()
        self.dismissDropDown()
        updateUIDelegate?.updateUI()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        dropView = dropDownView.init(frame: .zero)
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        configDropDownOption()
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    func configDropDownOption(){
        dropView.dropDownOptions = ["Dash"]
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.title.font = UIFont.systemFont(ofSize: 14)
        self.layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        
        let origimage = UIImage(named:"dropdown")
        let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
        self.setImageToRightIcon(withImage: tintedImage!, tintColor:hexStringToUIColor(hex: "#000000"), backgroundColor: hexStringToUIColor(hex: "#FFFFFF"))
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    func changeDropDownOption(){
        
        if self.title.text! == "Solid" {
            dropView.dropDownOptions = ["Dash"]
        }
        else {
            dropView.dropDownOptions = ["Solid"]
        }
        dropView.tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
