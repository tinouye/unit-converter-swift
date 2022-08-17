//
//  Conversions.swift
//  unit-converter
//
//  Created by Media Room on 8/16/22.
//

import Foundation
import SwiftUI

func updateDensityCalc(val valStr: String, unit unitStr: String, density densityStr: String) -> String {

    var outputMeasurement: Double = 0.0
    guard let val = Double(valStr) else {
        return String(outputMeasurement)
    }
    guard let density = Double(densityStr) else {
        return String(outputMeasurement+1)
    }
    
    //let inputMeasurement = Measurement(value: val, unit: UnitMass.grams)
    outputMeasurement = val/density
    return String(outputMeasurement)
}
