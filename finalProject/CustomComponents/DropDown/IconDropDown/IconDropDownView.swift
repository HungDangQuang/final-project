//
//  IconDropDownView.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import UIKit

class IcondropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions:[String]!
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    var buttonImageViewModel = ButtonImageViewModel()
    
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
        
        buttonImageViewModel.arrButton.bind { res in
            self.dropDownOptions = res
        }
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
