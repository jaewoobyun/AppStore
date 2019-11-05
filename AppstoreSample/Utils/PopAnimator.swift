//
//  PopAnimator.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/25.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	let duration = 1.0
	var presenting = true
	var originFrame = CGRect.zero
	
	var dismissCompletion: (()->Void)?
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		
		let containerView = transitionContext.containerView
		
		let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
		let fromView = presenting ? toView : transitionContext.view(forKey: .from)!
		
		let initialFrame = presenting ? originFrame : fromView.frame
		let finalFrame = presenting ? fromView.frame : originFrame
		
		let xScaleFactor = presenting ?
			initialFrame.width / finalFrame.width :
			finalFrame.width / initialFrame.width
		
		let yScaleFactor = presenting ?
			initialFrame.height / finalFrame.height :
			finalFrame.height / initialFrame.height
		
		let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
		
		if presenting {
			fromView.transform = scaleTransform
			fromView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
			fromView.clipsToBounds = true
		}
		
		containerView.addSubview(toView)
		containerView.bringSubviewToFront(fromView)
		
//		let detailController = transitionContext.viewController(forKey: presenting ? .to : .from ) as! DetailController
		
//		if presenting {
//			detailController.view.alpha = 0.0
//		}
		
		UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
			fromView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
			fromView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//			detailController.view.alpha = self.presenting ? 1.0 : 0.0
			toView.alpha = self.presenting ? 1.0 : 0.0
			fromView.layer.cornerRadius = self.presenting ? 0.0 : 20.0/xScaleFactor
		}) { (_) in
			if !self.presenting {
				self.dismissCompletion?()
			}
			transitionContext.completeTransition(true)
		}
		
	}
	
	
	
	
}
