//
//  BaseTabbar.swift
//  finalProject
//
//  Created by QUANG HUNG on 14/Jan/2022.
//

import Foundation
import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        tabBar.barTintColor = UIColor.gray
        delegate = self
        self.navigationController?.navigationBar.isHidden = true
        setUpTabbar()

//        guard let items = self.tabBar.items else {
//            return
//        }
//
//        let images = ["house", "person"]
//
//        for x in 0...1 {
//            items[x].image = UIImage(systemName: images[x])
//        }
    }
    
    func setUpTabbar(){
        
        let tab1 = UINavigationController(rootViewController: ViewController())
        tab1.tabBarItem.image = UIImage(named: "list")
        
        let tab2 = UINavigationController(rootViewController: CustomButtonViewController())
        tab2.tabBarItem.image = UIImage(named:  "customize")
        
        let tab3 = UINavigationController(rootViewController: ButtonListViewController())
        tab3.tabBarItem.image = UIImage(named: "list2")
        
        let tab4 = UINavigationController(rootViewController: AuthenticationViewController())
        tab4.tabBarItem.image = UIImage(named: "sync")
        
        viewControllers = [tab1,tab2,tab3,tab4]
    }
    

}
extension BaseTabbarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}

class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.4
    
    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart
        
        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }
    
    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
