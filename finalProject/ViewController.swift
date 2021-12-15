//
//  ViewController.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Dec/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let customButton = customButton()
        customButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            NSLayoutConstraint(item: customButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.25, constant: 0),
            NSLayoutConstraint(item: customButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.02, constant: 0)
        ])
        customButton.setTitle(withTitle: "Mod")
    }

}

