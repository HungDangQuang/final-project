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
        
        
//        let newView = testView()
//        view.addSubview(newView)
//        newView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            newView.topAnchor.constraint(equalTo: view.topAnchor),
//            newView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            newView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            newView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        
//       let newLabel = customLabel()
//        newLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(newLabel)
//
////        view.backgroundColor = .brown
//
//        NSLayoutConstraint.activate([
////            newLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
////            newLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
//            newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            newLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        let customButton = customButton()
        customButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
//            customButton.topAnchor.constraint(equalTo: view.topAnchor),
//            customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            customButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            NSLayoutConstraint(item: customButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.25, constant: 0),
            NSLayoutConstraint(item: customButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.05, constant: 0)
        ])
        
        
    }


}

