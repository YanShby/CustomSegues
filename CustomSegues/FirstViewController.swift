//
//  ViewController.swift
//  CustomSegues
//
//  Created by Yans on 16/5/26.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(showSecondViewController))
        swipe.direction = .Up
        self.view.addGestureRecognizer(swipe)
        
    }
    
    func showSecondViewController() {
        self.performSegueWithIdentifier("firstSegue", sender: self)
    }
    
    @IBAction func returnFromSegueActions(sender:UIStoryboardSegue) {
        if sender.identifier == "firstSegueUnwind" {
            print("第二个视图退场，第一个视图进场。")
        } else if sender.identifier == "secondSegueUnwind" {
            print("第三个视图退场，第一个视图进场。")
        }
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        if let id = identifier {
            if id == "firstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: {
                })
                return unwindSegue
            } else if id == "secondSegueUnwind"{
                let unwindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: {
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstSegue" {
            let secondVC = segue.destinationViewController as! SecondViewController
            secondVC.message = "Hello from the ViewController#1"
        }
    }

    @IBAction func toVC3(sender: UIButton) {
        self.performSegueWithIdentifier("secondSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

