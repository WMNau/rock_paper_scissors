//
//  RoundedButton.swift
//  Rock Paper Scissors
//
//  Created by Mike on 5/30/19.
//  Copyright © 2019 William Nau. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 7.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
