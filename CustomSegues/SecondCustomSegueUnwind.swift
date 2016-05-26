//
//  SecondCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Yans on 16/5/26.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        let thirdVCView = sourceViewController.view as UIView!
        let firstVCView = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, belowSubview: thirdVCView)
        
        firstVCView.transform = CGAffineTransformScale(firstVCView.transform, 0.001, 0.001)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            thirdVCView.transform = CGAffineTransformScale(firstVCView.transform, 0.001, 0.001)
            
        }) { (Finished) -> Void in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                firstVCView.transform = CGAffineTransformIdentity
                }, completion: { (_) -> Void in
                    thirdVCView.transform = CGAffineTransformIdentity
                    self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
            })
        }

    }

}
