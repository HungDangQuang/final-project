//
//  customLabel.swift
//  finalProject
//
//  Created by QUANG HUNG on 13/Dec/2021.
//

import Foundation
import UIKit

class customLabel:UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpDefaultLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: .zero)
    }
        
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
          get {
              
              if text != nil {
                  var contentSize = super.intrinsicContentSize
                  contentSize.height += 36
                  contentSize.width += 36
                  return contentSize
              }
              else {
                  var contentSize = super.intrinsicContentSize
                  contentSize.height += 0
                  contentSize.width += 0
                  return contentSize
              }
              
        }
    }
    
    func setUpDefaultLabel(){
//        text = "button"
        
//        let attributedString = NSMutableAttributedString(string: text!)
//
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: NSRange(location: 0, length: text!.count))
//        attributedString.addAttribute(.kern, value: NSNumber(value: 2), range: NSRange(location: 0, length: text!.count))
        
//        self.insetsLayoutMarginsFromSafeArea = false
//        self.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
//        self.layoutMarginsDidChange()
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
//        self.attributedText = attributedString
//        backgroundColor = .blue
        
    }
    
}
    
extension String {
    
    func htmlAttributedString(text: String) -> NSAttributedString? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        
        
        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
    }
    
    func verifyUrl(urlString: String?) -> Bool {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return false
        }

        return UIApplication.shared.canOpenURL(url)
    }
    
    func makeLink(text: String) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .link: text
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        return attributedString
    }
    
    func convertToAttributedString() -> NSAttributedString {
        let arrString = self.components(separatedBy: " ")
        var result = NSAttributedString()
        
        for word in arrString {
             if verifyUrl(urlString: word) == true {
                result = result ^ makeLink(text: word) ^ NSAttributedString(string: " ")
            }
            else {
                result = result ^ htmlAttributedString(text: word)! ^ NSAttributedString(string: " ")
            }
        }
        
        
        return result
    }
}


func ^ (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}
