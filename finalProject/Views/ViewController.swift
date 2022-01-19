//
//  ViewController.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Dec/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView : UICollectionView!
    private var buttonConfigViewModel: ButtonConfigViewModel!
    private var datasource: ButtonConfigDatasource<ButtonCollectionViewCell, ButtonOption>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:20)
        layout.itemSize = CGSize(width: view.frame.width/3, height: view.frame.height/15)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCollectionViewCell")
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0)
            ])
        
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.backgroundColor = .white
        
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.buttonConfigViewModel = ButtonConfigViewModel()
        self.datasource = ButtonConfigDatasource(cellIdentifier: "ButtonCollectionViewCell", items: self.buttonConfigViewModel.arrButton.value, configureCell: { cell,res in
            if res.buttonText != nil {
                cell.button.setTitle(withTitle: res.buttonText!)
            }
            
            if res.buttonTextColor != nil {
                cell.button.title.textColor = hexStringToUIColor(hex: res.buttonTextColor!)
            }
            
            if res.buttonWidth != 0 {
                
            }
            
            if res.buttonHeight != 0 {
                
            }
            
            if res.buttonBackgroundColor != nil {
                cell.button.backgroundColor = hexStringToUIColor(hex: res.buttonBackgroundColor!)
            }
            
            if res.border != nil {
                cell.button.layer.borderWidth = CGFloat(res.border!)
            }
            
            if res.borderColor != nil {
                cell.button.layer.borderColor = hexStringToCGColor(hex: res.borderColor!)
            }
            
            if res.borderRadius != nil {
                cell.button.layer.cornerRadius = CGFloat(res.borderRadius!)
            }
            
            if res.leftIcon != nil {
                let origimage = UIImage(named: res.leftIcon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.addLeftIcon(img: tintedImage!)
            }
            
            if res.rightIcon != nil {
                let origimage = UIImage(named: res.rightIcon!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.addRightIcon(img: tintedImage!)
            }
            
            cell.button.layoutIfNeeded()
            
            if res.borderDashPattern != nil {
                let array = res.borderDashPattern?.components(separatedBy: ",")
                var dashPattern: [NSNumber] = []
                for element in array! {
                    if let num = Int(element) {
                        let nsNumber = NSNumber(value: num)
                        dashPattern.insert(nsNumber, at: dashPattern.endIndex)
                    }
                }
                cell.button.addDashedBorder(dashedPattern: dashPattern)
            }
            
            if res.tintColor != nil {
                cell.button.addTintColor(tintColor: res.tintColor!)
            }
            
            if res.iconBackgroundColor != nil {
                cell.button.addIconBackgroundColor(bgColor: res.iconBackgroundColor!)
            }
        })
        
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.datasource
            self.collectionView.reloadData()
        }
    }
}



    func hexStringToCGColor (hex:String) -> CGColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }


        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return CGColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


