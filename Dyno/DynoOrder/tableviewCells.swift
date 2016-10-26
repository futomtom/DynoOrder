//
//  ItemDetailCell.swift
//  DynoOrder
//
//  Created by Alex on 10/25/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func displayData(item:PurchaseItem) {
        textLabel?.text = item.product.name
        detailTextLabel?.text = "\(item.getSubtotal())"
        
    }
}


class HeaderTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func displayData(order:Order) {
        textLabel?.text = order.name
        detailTextLabel?.text = "\(order.total)"
        
    }
}


