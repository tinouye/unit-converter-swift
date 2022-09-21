//
//  ContentView.swift
//  Shared
//
//  Created by Media Room on 8/10/22.
//

import SwiftUI

var testFoo = 4
let units = [
    "Ounces",
    "Pounds",
    "Grams",
    "Kilograms",
    "Teaspoons",
    "Tablespoons",
    "Fluid Ounces",
    "Cups",
    "Pints",
    "Quarts",
    "Gallons",
    "Mililiters",
    "Liters"
]

struct ContentView: View {
    @State private var inputValue: String = "20"
    @State private var outputValue: String = "asdf"
    @State private var currIngredient: Ingredient = Ingredient(name: "None", density: "0")
    @State private var ingredientLabel: String = "Choose an Ingredient"
    @State private var inputUnit: String = "Convert from:"
    @State private var outputUnit: String = "Convert to:"
    
    var body: some View {
        VStack{
            // Enter number to convert here
            TextField("test", text: $inputValue)
            
            HStack{
                // Input unit
                Menu(inputUnit) {
                    ForEach(units.indices, id: \.self) {index in
                        Button(units[index], action: {
                            inputUnit = units[index]
                        })
                    }
                }
                // Output unit
                Menu(outputUnit) {
                    ForEach(units.indices, id: \.self) {index in
                        Button(units[index]) {
                            outputUnit = units[index]
                        }
                    }
                }
            }
            
            //Ingredient picker
            Menu(ingredientLabel) {
                ForEach(ingredientsList.indices, id: \.self) {index in
                    Button(ingredientsList[index].name) {
                        currIngredient = ingredientsList[index]
                        ingredientLabel = ingredientsList[index].name
                    }
                }
            }
            Button("Convert") {
                outputValue = updateDensityCalc(val: inputValue, inputUnit: inputUnit, outputUnit: outputUnit, density: currIngredient.density)

            }
            Text("\(inputValue) \(inputUnit) = \(outputValue) \(outputUnit)")

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
