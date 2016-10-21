//
//  PresentedViewController.swift
//
//  Created by Jon Kent on 12/14/15.
//  Copyright © 2015 Jon Kent. All rights reserved.
//

import UIKit
import SideMenu

class PresentedViewController: UIViewController {

    @IBAction fileprivate func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let RightButtonItem = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action:  #selector(self.OpenMenu))
        self.navigationItem.setLeftBarButton(RightButtonItem, animated: true)
    }
    
    
    func OpenMenu() {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
}
