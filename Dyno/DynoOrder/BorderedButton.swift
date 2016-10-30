//
//  BorderedButton.swift
//  DynoCapture3
//
//  Created by Alex FU on 1/29/16.
//  Copyright © 2016 DynSense. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedButton: UIButton {

    override func awakeFromNib() {
        layer.borderColor=UIColor.blue.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
    }
  }
