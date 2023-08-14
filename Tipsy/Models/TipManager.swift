//
//  TipManager.swift
//  Tipsy
//
//  Created by Burak Karasel on 12.08.2023.
//

import Foundation

struct TipManager {
    var pricePerPerson : Float?
    var info : String?
    
    mutating func calculateTipPerPerson(totalPrice : Float, personCount : Int, tipPercent : Int) {
        let priceWithTip = totalPrice * (Float(100 + tipPercent) / 100)
        self.pricePerPerson = priceWithTip / Float(personCount)
        self.info = " Split between \(personCount) people, with \(tipPercent)% tip."
    }
    
    func getPricePerPerson() -> Float? {
        return self.pricePerPerson
    }
    
    func getInfo() -> String? {
        return self.info
    }
}
