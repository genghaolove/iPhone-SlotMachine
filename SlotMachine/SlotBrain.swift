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
        var colorWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkColor(slotRow) {
                println("Color!")
                winnings++
                colorWinCount++
            }
            
            if checkThreeInARow(slotRow) {
                println("Three in a row!")
                winnings++
                straightWinCount++
            }
            
            if checkThreeOfAKind(slotRow) {
                println("Three of a kind!")
                winnings += 3
                threeOfAKindWinCount++
            }
        }
        
        if colorWinCount == 3 {
            println("Royal flush!")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic sreak!")
            winnings += 500
        }
        
        if threeOfAKindWinCount == 3 {
            println("Threes all around!")
            winnings += 100
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
    
    // Helpers
    
    class func checkColor(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot2.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot2.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
}






