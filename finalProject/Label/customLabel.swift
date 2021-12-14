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
    
    func setUpDefaultLabel(){
        text = "test label"
        textAlignment = .center
        textColor = .black
        backgroundColor = .brown
        font = UIFont.systemFont(ofSize: 15)
        
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
