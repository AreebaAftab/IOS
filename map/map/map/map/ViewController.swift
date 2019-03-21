//
//  ViewController.swift
//  map
//
//  Created by user147466 on 3/14/19.
//  Copyright © 2019 user147466. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var textField1: UITextField!
    
    
    var nameText = ""
    var nameText1 = ""
    lazy var myFloatt = (nameText as NSString).floatValue
    lazy var myFloatt1 = (nameText1 as NSString).floatValue
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func done(_ sender: Any) {
        self.nameText = textField.text!
        self.nameText1 = textField1.text!
        if let url = URL(string: "https://www.google.com/maps/@myFloatt,MyFloatt1,6z"), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        
    }
    @IBAction func map(_ sender: Any) {
        self.nameText = textField.text!
        self.nameText1 = textField1.text!
        performSegue(withIdentifier: "name", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! NameViewController
        vc.finalName = self.nameText
        vc.finalName1 = self.nameText1
    }}

