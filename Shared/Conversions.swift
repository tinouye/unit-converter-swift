//
//  Conversions.swift
//  unit-converter
//
//  Created by Media Room on 8/16/22.
//

import Foundation
import SwiftUI

func updateDensityCalc(val valStr: String, inputUnit inputUnitStr: String, outputUnit outputUnitStr: String, density densityStr: String) -> String {
    
    let unitsDict = [
        "oz": UnitMass.ounces,
        "lb": UnitMass.pounds,
        "g": UnitMass.grams,
        "kg": UnitMass.kilograms,
        "tsp": UnitVolume.teaspoons,
        "tbsp": UnitVolume.tablespoons,
        "fl-oz": UnitVolume.fluidOunces,
        "cup": UnitVolume.cups,
        "pint": UnitVolume.pints,
        "quart": UnitVolume.quarts,
        "gal": UnitVolume.gallons,
        "ml": UnitVolume.milliliters,
        "l": UnitVolume.liters
    ]
    
    //Ensure that arguments from user input are valid
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
    var outputVal: Double = 0.0
    
    // If input and output units are the same, do direct conversion
    if (inputMeasurement.unit is UnitMass && outputUnit is UnitMass)
    || (inputMeasurement.unit is UnitVolume && outputUnit is UnitVolume) {
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        outputVal = outputMeasurement.value
    }
    
    
    //Mass to volume: input unit -> grams -> divide by density (g/ml) -> ml -> output unit
    else if inputMeasurement.unit is UnitMass {
        let measurementGrams = inputMeasurement.converted(to: UnitMass.grams)
        let mlValue = measurementGrams.value/density
        let measurementMl = Measurement(value:mlValue, unit: UnitVolume.milliliters)
        let outputMeasurement = measurementMl.converted(to: outputUnit as! UnitVolume)
        outputVal = outputMeasurement.value
    }
    
    else if inputMeasurement.unit is UnitVolume {
        let measurementMl = inputMeasurement.converted(to: UnitVolume.milliliters)
        let gValue = measurementMl.value/density
        let measurementG = Measurement(value:gValue, unit: UnitMass.grams)
        let outputMeasurement = measurementG.converted(to: outputUnit as! UnitMass)
        outputVal = outputMeasurement.value
    }
    
    //Round to 3 decimal places
    outputVal = (outputVal*1000).rounded()/1000
    
    return String(outputVal)
}
