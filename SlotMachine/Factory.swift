//
//  Factory.swift
//  SlotMachine
//
//  Created by Hrvoje Baic on 14/03/15.
//  Copyright (c) 2015 Hrvoje Baic. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    class func createSlots() -> [[Slot]] {
        let numberOfSlots = 3
        let numberOfContainers = 3
        
        var slots: [[Slot]] = []
        
        for containerNumber in 0..<numberOfContainers {
            var slotArray: [Slot] = []
            
            for slotNumber in 0..<numberOfSlots {
                var slot = Slot()
                slotArray.append(slot)
            }
            
            slots.append(slotArray)
        }
        
        return slots
    }
    
    class func createSlot(currentCards: [Slot]) -> Slot {
        var currentCardValues: [Int] = []
    }
}