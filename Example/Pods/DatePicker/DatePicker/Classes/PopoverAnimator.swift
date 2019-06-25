//
//  CustumModalTransition.swift
//  HZX
//
//  Created by panjiulong on 2017/8/7.
//  Copyright © 2017年 panjiulong. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {

    var transitionDuration:TimeInterval
    var backColor:UIColor
    
    init(transitionDuration:TimeInterval,backColor:UIColor) {
        self.transitionDuration = transitionDuration
        self.backColor = backColor
    }
    
    var isPresented : Bool = false
    lazy var backGroundView : UIView = {
        let view = UIView()
        view.backgroundColor = backColor
        view.alpha = 0.01
        return view
    }()
}
extension PopoverAnimator:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}

extension PopoverAnimator:UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print(isPresented)
        isPresented ? animationForPresentedView(transitionContext: transitionContext) : animationForDismissedView(transitionContext: transitionContext)
    }
    
    func animationForPresentedView(transitionContext: UIViewControllerContextTransitioning) {
        let presentedView = transitionContext.view(forKey: .to)!
        presentedView.size = transitionContext.containerView.size
        presentedView.frame.origin.y = transitionContext.containerView.frame.size.height
        
        backGroundView.frame = transitionContext.containerView.bounds
        transitionContext.containerView.addSubview(backGroundView)
        transitionContext.containerView.addSubview(presentedView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {[weak self] in
            presentedView.frame.origin.y = 0.0
            self?.backGroundView.alpha = 1.0
            
        }) { (_) in
             transitionContext.completeTransition(true)
        }
    }
    
    func animationForDismissedView(transitionContext: UIViewControllerContextTransitioning) {
        let dismissView = transitionContext.view(forKey: .from)!
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            dismissView.frame.origin.y = transitionContext.containerView.frame.size.height
            self.backGroundView.alpha = 0.01

        }) { (_) in
            dismissView.removeFromSuperview()
            transitionContext.completeTransition(true)
            self.backGroundView.removeFromSuperview()
        }
    }
}
extension UIView{
    var size : CGSize {
        get{
            return frame.size
        }
        set{
            var tempFrame :CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
}
