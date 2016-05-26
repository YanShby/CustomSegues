//
//  FirstCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Yans on 16/5/26.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        
        let secondView = self.sourceViewController.view as UIView!
        let firstView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstView, aboveSubview: secondView)
        
        UIView.animateWithDuration(0.5, animations: {
            firstView.frame = CGRectOffset(firstView.frame, 0, screenHeight)
            secondView.frame = CGRectOffset(secondView.frame, 0, screenHeight)
        }) { (_) in
             self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }

    }

}
