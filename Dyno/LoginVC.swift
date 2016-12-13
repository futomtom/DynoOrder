//
//  LoginVC.swift
//  DynoOrder
//
//  Created by Alex on 10/24/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SideMenu

class LoginVC: UIViewController {

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Label1: UILabel!


        override func viewDidLoad() {
            super.viewDidLoad()
            
        
           
            Label1.text = NSLocalizedString("hello",comment:"")


            
            
            
        }
        
      
    @IBAction func Login(_ sender: AnyObject) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "putorder") 
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
        
    }

  

  
}
