//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Hongsun Yoon, M.D. on 11/14/14.
//  Copyright (c) 2014 Hongsun Yoon, M.D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonTextLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    
    var balloonArray:[BalloonStruct] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var count: Int
        for count = 1; count < 100; count++ {
        
        var randomBalloonImageNumber = Int(arc4random_uniform(UInt32(4))) + 1
        var randomImageString = "RedBalloon\(randomBalloonImageNumber).jpg"
        let numberString = "\(count) balloons"
            
        
        var balloonInstance = BalloonStruct (balloonImage: UIImage(named: randomImageString), balloonNumber: count, balloonText: numberString)
                
        balloonArray.append(balloonInstance)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        
//        var randomChoosenNumber = Int(arc4random_uniform(UInt32(99))) + 1
        let choosenInstance = self.balloonArray [currentIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.balloonTextLabel.text = choosenInstance.balloonText
            self.balloonImage.image = choosenInstance.balloonImage
            self.currentIndex++
            
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

