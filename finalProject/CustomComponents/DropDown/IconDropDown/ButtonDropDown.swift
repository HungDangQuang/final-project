//
//  ButtonDropDown.swift
//  finalProject
//
//  Created by QUANG HUNG on 01/Jan/2022.
//

import Foundation
import UIKit

protocol updateTintColorProtocol {
    func updateTintColor()
}

protocol updateButtonProtocol {
    func update()
}

class IconDropDownBtn: customButton, dropDownProtocol {
    
    var updateTintColorDelegate: updateTintColorProtocol!
    var updateImageDelegate: updateButtonProtocol!
    
    func dropDownPressed(string: String) {
        self.setTitle(withTitle: string)
        if string == "No" {
            option.alpha = 0
            option.dropView.tableView.alpha = 0
            option.title.text = nil
            self.option.dismissDropDown()
            updateImageDelegate.update()
        }
        else {
            option.alpha = 1
            option.dropView.tableView.alpha = 1
        }
        updateTintColorDelegate.updateTintColor()
        changeDropDownOption()
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    var option = IconOptionDropDownBtn()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        dropView = dropDownView.init(frame: .zero)
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        configDropDownOption()
        configDropDown()
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
        option.widthAnchor.constraint(equalToConstant: 220).isActive = true
        option.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
       
        option.alpha = 0
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
    
    func configDropDown(){
        
        layer.borderWidth = 1
        layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        let origimage = UIImage(named:"dropdown")?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
        
        addRightIcon(img: tintedImage!)
        addIconBackgroundColor(bgColor: "#FFFFFF")
        addTintColor(tintColor: "#000000")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol sendImageNameProtocol {
    func sendImageName(name: String)
}


class IconOptionDropDownBtn: customButton, dropDownProtocol {
    
    
    func dropDownPressed(string: String) {
        self.setTitle(withTitle: string)
        sendImageDelegate.sendImageName(name: string)
        self.dismissDropDown()
    }
    
    var dropView = IcondropDownView()
    var sendImageDelegate: sendImageNameProtocol!
    
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        dropView = IcondropDownView.init(frame: .zero)
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.title.font = UIFont.systemFont(ofSize: 14)
        self.layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        
        let origimage = UIImage(named:"dropdown")
        let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
        self.addRightIcon(img: tintedImage!)
        addTintColor(tintColor: "#000000")
        addIconBackgroundColor(bgColor: "#FFFFFF")
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
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
