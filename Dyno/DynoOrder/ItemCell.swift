//
//  ItemCell.swift
//  DynoOrder
//
//  Created by alexfu on 10/20/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import ValueStepper

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var number: UILabel!
    let colors = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.cyan, UIColor.gray,UIColor.brown, UIColor.orange ]
    
    func setData(item: Product, index:Int) {
       // imageV.image = UIImage(name: "   ")
        name.text = item.name
        backgroundColor = colors[index%colors.count]
       
    }
    
}






