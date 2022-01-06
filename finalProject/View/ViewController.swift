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
    private var datasource: ButtonConfigDatasource<ButtonCollectionViewCell, ButtonConfig>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.7, constant: 0)
            ])

        callToViewModelForUIUpdate()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(pushToNextVC))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func pushToNextVC(){
        let customButtonVC = CustomButtonViewController()
        navigationController?.pushViewController(customButtonVC, animated: true)
    }
    
    func callToViewModelForUIUpdate(){
        
        self.buttonConfigViewModel = ButtonConfigViewModel()
        
        self.datasource = ButtonConfigDatasource(cellIdentifier: "ButtonCollectionViewCell", items: self.buttonConfigViewModel.config.value, configureCell: { cell,res  in
            
//            if res.width != nil {
//                print("not 1 nil")
//            }
//
//            if res.height != nil {
//
//            }
            
            if res.leftIconName != nil {
                let origimage = UIImage(named: res.leftIconName!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.setImageToLeftIcon(withImage: tintedImage!, tintColor: hexStringToUIColor(hex: res.iconTintcolor!), backgroundColor: hexStringToUIColor(hex: res.iconBackgroundColor!))
                
            }
                        
            if res.iconBackgroundColor != nil {
                cell.button.leftIcon.backgroundColor = hexStringToUIColor(hex: res.iconBackgroundColor!)
                cell.button.leftIcon.tintColor = hexStringToUIColor(hex: res.iconTintcolor!)
                
//                cell.button.rightIcon.backgroundColor = hexStringToUIColor(hex: res.iconBackgroundColor!)
                
//                cell.button.rightIcon.tintColor = hexStringToUIColor(hex: res.iconTintcolor!)
                
//                cell.button.rightIcon.backgroundColor = hexStringToUIColor(hex: res.iconTintcolor!)
//                cell.button.rightIcon.tintColor = hexStringToUIColor(hex: res.textColor!)
            }
            
            if res.title != nil {
                cell.button.setTitle(withTitle: res.title!)
            }
            
            if res.backgroundColor != nil {
                cell.button.backgroundColor = hexStringToUIColor(hex: res.backgroundColor!)
                cell.button.rightIcon.backgroundColor = hexStringToUIColor(hex: res.backgroundColor!)
            }
            
            if res.rightIconName != nil {
                let origimage = UIImage(named: res.rightIconName!)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                let tintedImage = origimage?.withRenderingMode(.alwaysTemplate)
                cell.button.setImageToRightIcon(withImage: tintedImage!, tintColor: hexStringToUIColor(hex: res.iconTintcolor!), backgroundColor: hexStringToUIColor(hex: res.iconBackgroundColor!))
                
            }
            
            if res.textColor != nil {
                cell.button.title.textColor = hexStringToUIColor(hex: res.textColor!)
            }
            
            cell.layoutIfNeeded()
            
            cell.button.layer.cornerRadius = CGFloat(res.cornerRadius)
            cell.button.layer.borderWidth = CGFloat(res.borderWidth)
            
//            cell.button.layer.masksToBounds = false
//            cell.button.layer.cornerRadius = cell.button.frame.width/2
//            cell.button.clipsToBounds = true
            
            if res.isRounded == true {
                cell.button.drawRoundBorder()
            }
            
            if res.border == true {
                if res.borderColor != nil {
                    cell.button.addDashedBorder(borderColor: hexStringToCGColor(hex: res.borderColor!))
                }
                else {
                    cell.button.addDashedBorder(borderColor: UIColor.black.cgColor)
                }
            }
            
            if res.borderColor != nil {
                cell.button.layer.borderColor = hexStringToCGColor(hex: res.borderColor!)
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




//        let customButton = customButton()
//        customButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(customButton)
//
//        NSLayoutConstraint.activate([
//            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            customButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//
//            NSLayoutConstraint(item: customButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.45, constant: 0),
//            NSLayoutConstraint(item: customButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.04, constant: 0)
//        ])
//
//        self.view.setNeedsLayout()
//        self.view.layoutIfNeeded()


//        customButton.setTitle(withTitle: "Button")


//        customButton.setImageToLeftIcon(withImage: UIImage(systemName: "house")!)
//        customButton.setImageToRightIcon(withImage: UIImage(systemName: "house")!)
//        customButton.setImageToLeftIcon(withImage: UIImage(systemName: "house")!)
//        customButton.setImageToRightIcon(withImage: UIImage(systemName: "house")!.withAlignmentRectInsets(UIEdgeInsets(top: -7, left: -7, bottom: -7, right: -7)))

//        customButton.layer.cornerRadius = 15
//        customButton.layer.borderWidth = 2


//        customButton.layer.borderColor = hexStringToUIColor(hex: "#f5958e").cgColor
//        customButton.addDashedBorder()
//        print(customButton.layer.borderWidth)
