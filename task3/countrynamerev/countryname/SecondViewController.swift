//
//  SecondViewController.swift
//  countryname
//
//  Created by user142944 on 3/1/19.
//  Copyright © 2019 user142944. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var myView: UIView!
    @objc func tapAction(sender:UITapGestureRecognizer){
        if sender.state == .ended{
            statusLabel.text = "Tapped"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.tapAction(sender:)))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        self.myView.addGestureRecognizer(tapGesture)
        let left = UISwipeGestureRecognizer(target : self, action : #selector(SecondViewController.leftSwipe))
        left.direction = .left
        self.myView.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target : self, action : #selector(SecondViewController.rightSwipe))
        right.direction = .right
        self.myView.addGestureRecognizer(right)
        
        let up = UISwipeGestureRecognizer(target : self, action : #selector(SecondViewController.upSwipe))
        up.direction = .up
        self.myView.addGestureRecognizer(up)
        
        let down = UISwipeGestureRecognizer(target : self, action : #selector(SecondViewController.downSwipe))
        down.direction = .down
        self.myView.addGestureRecognizer(down)
        
        
    }
    @objc
    func leftSwipe(){
        self.myView.backgroundColor = UIColor.blue
    }
    
    @objc
    func rightSwipe(){
        self.myView.backgroundColor = UIColor.green
    }
    
    @objc
    func upSwipe(){
        self.myView.backgroundColor = UIColor.yellow
    }
    
    @objc
    func downSwipe(){
        self.myView.backgroundColor = UIColor.gray
    }


}

