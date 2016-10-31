//
//  CollectionHeadView.swift
//  DynoOrder
//
//  Created by Alex on 10/29/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class CollectionHeadView: UICollectionReusableView {
    
    @IBOutlet weak var items: UILabel!
    
    @IBOutlet weak var Button: UIButton! {
        didSet {
            Button.layer.borderColor = UIColor (red: 0.24, green: 0.49, blue: 0.84, alpha: 1.0).cgColor
            Button.layer.borderWidth = 1
            Button.layer.cornerRadius = 4
        }
    }
        
 
}
