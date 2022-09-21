//
//  Density.swift
//  unit-converter (iOS)
//
//  Created by Media Room on 8/14/22.
//

import Foundation
import SwiftUI

struct Ingredient: Hashable, Codable {
    var name: String
    var density: String
}

class InputsHolder {
    var inputValue: String
    var inputUnit: String
    var outputUnit: String
    var ingredient: Ingredient
    var outputValue: String
    
    init(inputValue: String, inputUnit: String, outputUnit: String, ingredient: Ingredient) {
        self.inputValue = inputValue
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
        self.ingredient = ingredient
        self.outputValue = "0"
    }
    
    func convert() {
        self.outputValue = updateDensityCalc(val:self.inputValue, inputUnit:self.inputUnit, outputUnit:self.outputUnit, density:self.ingredient.density)
    }
}
