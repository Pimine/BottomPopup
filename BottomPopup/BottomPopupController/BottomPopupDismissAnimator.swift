//
//  DraggableDismissAnimator.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

final class BottomPopupDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private unowned var attributesOwner: BottomPresentableViewController
    
    init(attributesOwner: BottomPresentableViewController) {
        self.attributesOwner = attributesOwner
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return attributesOwner.popupDismissDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let dismissFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height), size: fromVC.view.frame.size)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0, usingSpringWithDamping: 1,
            initialSpringVelocity: 0, options: .curveEaseOut,
            animations: {
            fromVC.view.frame = dismissFrame
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
