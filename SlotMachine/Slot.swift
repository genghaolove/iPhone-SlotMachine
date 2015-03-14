//
//  Slot.swift
//  SlotMachine
//
//  Created by Hrvoje Baic on 09/03/15.
//  Copyright (c) 2015 Hrvoje Baic. All rights reserved.
//

import Foundation
import UIKit

class Slot {
    var value = 0
    var image:UIImage! = UIImage(named: "Ace")
    var isRed = true
    
    init (value: Int, image: UIImage, isRed: Bool) {
        self.value = value
        self.image = image
        self.isRed = isRed
    }
}