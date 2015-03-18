//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Hrvoje Baic on 18/03/15.
//  Copyright (c) 2015 Hrvoje Baic. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotInRow in slotsInRows {
            // TODO
        }
        
        return winnings
    }
    
    class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            
            for index in 0..<slotArray.count {
                let slot = slotArray[index]
                
                if index == 0 {
                    slotRow1.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2{
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        
        var slotInRows: [[Slot]] = [slotRow1, slotRow2, slotRow3]
        
        return slotInRows
    }
}