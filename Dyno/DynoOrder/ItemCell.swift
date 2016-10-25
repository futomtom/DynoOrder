//
//  ItemCell.swift
//  DynoOrder
//
//  Created by alexfu on 10/20/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    let colors = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.cyan, UIColor.gray,UIColor.brown, UIColor.orange ]
    
    func setData(item: Dish, index:Int) {
       // imageV.image = UIImage(name: "   ")
        TitleLabel.text = item.name
        backgroundColor = colors[index%colors.count]
        
    }
    
}






