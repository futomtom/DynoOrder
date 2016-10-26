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
    
    @IBOutlet var myview: UIView!

        override func viewDidLoad() {
            super.viewDidLoad()
            
        
            
            

            setupSideMenu()
            
            
        }
        
        fileprivate func setupSideMenu() {
            // Define the menus
            SideMenuManager.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
            SideMenuManager.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? UISideMenuNavigationController
            
            // Enable gestures. The left and/or right menus must be set up above for these to work.
            // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
            SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
            SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
            
        }

    @IBAction func Login(_ sender: AnyObject) {
        let vc:putOrderVC = storyboard!.instantiateViewController(withIdentifier: "putorder") as! putOrderVC
        present(vc, animated: true, completion: nil)
        
        
        
        
        
        
    }

  

  
}
