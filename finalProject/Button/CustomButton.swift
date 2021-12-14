//
//  CustomButton.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Dec/2021.
//

import Foundation
import UIKit

class customButton: UIControl{

//    var textColor: String?
//    var leftIcon: UIImage?
//    var leftIconColor: UIColor?
//    var rightIcon: UIImage?
//    var width: CGFloat?
//    var height: CGFloat?
    
    lazy var title: customLabel = {
        let titleLabel = customLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var leftIcon: UIImageView = {
        let imgview = UIImageView()
        return imgview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpLayout()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        addSubview(title)
        addSubview(leftIcon)
    }
    
    private func setUpLayout(){
        NSLayoutConstraint.activate([
            // layout of title label
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Leading: cach trai
            leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftIcon.trailingAnchor.constraint(equalTo: self.title.leadingAnchor)
            
            
        ])
    }
    
    func setImage(withImage img: UIImage){
        leftIcon.image = img
    }
    
    func setTitle(withTitle title: String){
        self.title.text = title
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 50)
    }
    
}




// Change hexa code to UIColor

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
