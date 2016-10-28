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
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var valueStepper: ValueStepper!
    
    let colors = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.cyan, UIColor.gray,UIColor.brown, UIColor.orange ]
    
    func setData(item: Product, index:Int) {
       // imageV.image = UIImage(name: "   ")
        TitleLabel.text = item.name
        backgroundColor = colors[index%colors.count]
        valueStepper.tag = index
    }
    
}






