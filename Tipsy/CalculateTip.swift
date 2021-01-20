//
//  CalculateTip.swift
//  Tipsy
//
//  Created by Hanna Putiprawan on 1/20/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateTip {

    var tip: Tip?

    mutating func calculateTip(billCost: Double, tipPercent: Double, numberOfPeople: Int) -> String {
        let result = (billCost + (billCost * tipPercent))
        return String(format: "%.2f", result)
    }
}
