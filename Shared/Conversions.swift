//
//  Conversions.swift
//  unit-converter
//
//  Created by Media Room on 8/16/22.
//

import Foundation
import SwiftUI

func updateDensityCalc(val valStr: String, inputUnit inputUnitStr: String, outputUnit outputUnitStr: String, density densityStr: String) -> String {
    
    let unitsDict = ["g": UnitMass.grams,
        "kg": UnitMass.kilograms,
        "ml": UnitVolume.milliliters,
        "tsp": UnitVolume.teaspoons,
        "tbsp": UnitVolume.tablespoons,
        "cup": UnitVolume.cups
    ]
    
    var outputMeasurement: Double = 0.0
    guard let val = Double(valStr) else {
        return "Invalid Value"
    }
    guard let density = Double(densityStr) else {
        return "Error with density value"
    }
    guard let inputUnit = unitsDict[inputUnitStr] else {
        //Error
        return "Invalid Input Unit"
    }
    guard let outputUnit = unitsDict[outputUnitStr] else {
        return "Invalid Output Unit"
    }
    
    let inputMeasurement: Measurement = Measurement(value:val, unit: inputUnit)
    
    if inputMeasurement.unit is UnitMass && outputUnit is UnitMass {
        print("foo")
    }
    
    
    //let inputMeasurement = Measurement(value: val, unit: UnitMass.grams)
    outputMeasurement = val/density
    return String(outputMeasurement)
}
