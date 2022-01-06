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
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class IcondropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = ["close-button", "dropdown"]
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.white
        self.backgroundColor = UIColor.white
        tableView.register(ButtonImageTableViewCell.self, forCellReuseIdentifier: ButtonImageTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonImageTableViewCell.identifier, for: indexPath) as! ButtonImageTableViewCell
        let origimage = UIImage(named: dropDownOptions[indexPath.row])?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
        cell.img.image = tintedImage

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


class ButtonImageTableViewCell: UITableViewCell {
    static let identifier = "ButtonImageTableViewCell"
    let img = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView(){
        img.translatesAutoresizingMaskIntoConstraints = false
        addSubview(img)
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: centerXAnchor),
            img.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
