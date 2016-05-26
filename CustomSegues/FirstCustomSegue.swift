//
//  FristCustomSegue.swift
//  CustomSegues
//
//  Created by Yans on 16/5/26.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let firstView = self.sourceViewController.view as UIView!
        let secondView = self.destinationViewController.view as UIView!
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        secondView.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondView, aboveSubview: firstView)
        
        UIView.animateWithDuration(0.5, animations: { 
            firstView.frame = CGRectOffset(firstView.frame, 0, -screenHeight)
            secondView.frame = CGRectOffset(secondView.frame, 0, -screenHeight)
            }) { (_) in
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
    }

}
