//
//  SecondViewController.swift
//  CustomSegues
//
//  Created by Yans on 16/5/26.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var messageVC2: UILabel!
    var message:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(showFirstViewController))
        swipe.direction = .Down
        self.view.addGestureRecognizer(swipe)
        
        messageVC2.text = message
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("firstSegueUnwind", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstSegueUnwind" {
            let firstVC = segue.destinationViewController as! FirstViewController
            firstVC.message.text = "You just came back from the ViewController#2"
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
