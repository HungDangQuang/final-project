//
//  ButtonListViewController.swift
//  finalProject
//
//  Created by QUANG HUNG on 08/Jan/2022.
//

import UIKit

class ButtonListViewController: UIViewController {

    var tableView: UITableView!
    var buttonListViewModel: ButtonListViewModel!
    var datasource:ButtonTableViewDataSource<ButtonTableViewCell,CustomButton>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        tableView = UITableView()
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        self.view.addSubview(tableView)
        setUpTablbleViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        callToViewModelForUIUpdate()
    }
     
    
    func setUpTablbleViewLayout(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 780),
        ])
    }
 
    func callToViewModelForUIUpdate(){
        buttonListViewModel = ButtonListViewModel()
        self.datasource = ButtonTableViewDataSource(cellIdentifier: "ButtonTableViewCell", items: self.buttonListViewModel.arrButton.value, configureCell: { cell,res in
            
            if res.button_text != nil {
                cell.button.setTitle(withTitle: res.button_text!)
            }
            
            if res.button_text_color != nil {
                cell.button.title.textColor = hexStringToUIColor(hex: res.button_text_color!)
            }
            
            if res.button_width != 0 {
                
            }
            
            if res.button_height != 0 {
                
            }
            
            if res.button_background_color != nil {
                cell.button.backgroundColor = hexStringToUIColor(hex: res.button_background_color!)
            }
            
            cell.button.layer.borderWidth = CGFloat(res.border)
            
            if res.border_color != nil {
                cell.button.layer.borderColor = hexStringToCGColor(hex: res.border_color!)
            }
            
            cell.button.layer.cornerRadius = CGFloat(res.border_radius)
            
            if res.left_icon != nil {
                let origimage = UIImage(named: res.left_icon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.addLeftIcon(img: tintedImage!)
            }
            
            if res.right_icon != nil {
                let origimage = UIImage(named: res.right_icon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.addRightIcon(img: tintedImage!)
            }
            
            cell.button.layoutIfNeeded()
            
            if res.border_dash_pattern != nil {
                let array = res.border_dash_pattern?.components(separatedBy: ",")
                var dashPattern: [NSNumber] = []
                for element in array! {
                    if let num = Int(element) {
                        let nsNumber = NSNumber(value: num)
                        dashPattern.insert(nsNumber, at: dashPattern.endIndex)
                    }
                }
                cell.button.addDashedBorder(dashedPattern: dashPattern)
            }
            
            if res.tint_color != nil {
                cell.button.addTintColor(tintColor: res.tint_color!)
            }
            
            if res.identifier != nil {
                cell.button.identifier = res.identifier!
            }
            
            cell.button.layoutIfNeeded()
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.datasource
            self.tableView.reloadData()
        }

    }
    
    @objc func pushToAuthenticationVC(){
        let authenticationVC = AuthenticationViewController()
        self.navigationController?.pushViewController(authenticationVC, animated: true)
    }
}

extension ButtonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
