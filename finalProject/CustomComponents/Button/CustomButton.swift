//
//  CustomButton.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Dec/2021.
//

import Foundation
import UIKit

class customButton: UIControl{
    
    lazy var title: customLabel = {
        let titleLabel = customLabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var rightIcon: UIView = {
        let img = UIView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        return img
    }()
    
    lazy var leftIcon: UIView = {
        let img = UIView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        return img
    }()
    
    lazy var contentView: UIStackView = {
        let contentView = UIStackView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.axis = .horizontal
        contentView.distribution = .equalSpacing
        contentView.alignment = .center
        contentView.spacing = 0
        
        [self.leftIcon,
         self.title,
         self.rightIcon].forEach { contentView.addArrangedSubview($0) }
        
        return contentView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(printHelloWorld), for: .touchUpInside)
        setUpViews()
        setUpLayout()
    }
    
    convenience init(){
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
       addSubview(contentView)
    }
    
    private func setUpLayout(){
        
        
        self.clearConstraints()
        
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.contentView.topAnchor.constraint(equalTo: topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
        
    func addLeftIcon(img: UIImage) {
        
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        leftIcon.addSubview(imgView)
        imgView.tag = 100
        
        imgView.leadingAnchor.constraint(equalTo: self.leftIcon.leadingAnchor, constant: 15).isActive = true
        imgView.trailingAnchor.constraint(equalTo: self.leftIcon.trailingAnchor, constant: -15).isActive = true
        imgView.topAnchor.constraint(equalTo: self.leftIcon.topAnchor, constant: 15).isActive = true
        imgView.bottomAnchor.constraint(equalTo: self.leftIcon.bottomAnchor, constant: -15).isActive = true
//        imgView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        leftIcon.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        leftIcon.widthAnchor.constraint(equalTo: leftIcon.heightAnchor).isActive = true
        self.contentView.layoutIfNeeded()
    }
    
    func addRightIcon(img: UIImage){
        
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.addSubview(imgView)
        imgView.tag = 200
    
        imgView.leadingAnchor.constraint(equalTo: self.rightIcon.leadingAnchor, constant: 15).isActive = true
        imgView.trailingAnchor.constraint(equalTo: self.rightIcon.trailingAnchor, constant: -15).isActive = true
        imgView.topAnchor.constraint(equalTo: self.rightIcon.topAnchor, constant: 15).isActive = true
        imgView.bottomAnchor.constraint(equalTo: self.rightIcon.bottomAnchor, constant: -15).isActive = true
//        imgView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        rightIcon.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        rightIcon.widthAnchor.constraint(equalTo: rightIcon.heightAnchor).isActive = true
        self.contentView.layoutIfNeeded()
    }
        
    func setTitle(withTitle title: String){
        self.title.text = title
        self.contentView.layoutIfNeeded()
    }
    
    func setUpBackgorundColor(hexCode: String){
        self.backgroundColor = hexStringToUIColor(hex: hexCode)
    }

    func drawRoundBorder(){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
      }
    
    func addDashedBorder(dashedPattern: [NSNumber]) {
//        let color = UIColor.black.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
            
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
//        if borderColor != nil {
//            shapeLayer.strokeColor = borderColor
//        }
        shapeLayer.strokeColor = self.layer.borderColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = dashedPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: self.layer.cornerRadius).cgPath
        shapeLayer.name = "dash"
        self.layer.addSublayer(shapeLayer)
    }
    
    @objc func printHello(){
        contentView.showAnimation {
            print("hello")
        }
    }

    @objc func printHelloWorld(){
        self.showAnimation {
            print("hellow")
        }
    }
    
    func addIconBackgroundColor(bgColor: String) {
        if let leftIcon = leftIcon.viewWithTag(100) {
            leftIcon.backgroundColor = hexStringToUIColor(hex: bgColor)
        }
        
        if let rightIcon = rightIcon.viewWithTag(200) {
            rightIcon.backgroundColor = hexStringToUIColor(hex: bgColor)
        }
    }
    
    func addTintColor(tintColor: String){
        if let leftIcon = leftIcon.viewWithTag(100) {
            leftIcon.tintColor = hexStringToUIColor(hex: tintColor)
        }
        
        if let rightIcon = rightIcon.viewWithTag(200) {
            rightIcon.tintColor = hexStringToUIColor(hex: tintColor)
        }
    }
    
    func removeImage(){
        if let leftIcon = leftIcon.viewWithTag(100) {
            leftIcon.removeFromSuperview()
        }
        
        if let rightIcon = rightIcon.viewWithTag(200){
            rightIcon.removeFromSuperview()
        }
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

extension UIView {

    /**
     Removes all constrains for this view
     */
    func clearConstraints() {
            for subview in self.subviews {
                subview.clearConstraints()
            }
            self.removeConstraints(self.constraints)
    }
    
//    override var alignmentRectInsets: UIEdgeInsets {
//            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        }
    
    func showAnimation(_ completionBlock: @escaping () -> Void) {
             isUserInteractionEnabled = false
               UIView.animate(withDuration: 0.1,
                              delay: 0,
                              options: .curveLinear,
                              animations: { [weak self] in
                                   self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
               }) {  (done) in
                   UIView.animate(withDuration: 0.1,
                                  delay: 0,
                                  options: .curveLinear,
                                  animations: { [weak self] in
                                       self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                   }) { [weak self] (_) in
                       self?.isUserInteractionEnabled = true
                       completionBlock()
                   }
               }
           }
}
