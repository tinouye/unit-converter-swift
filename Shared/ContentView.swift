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
    @State private var testInput: String = "20"
    @State private var testResult: String = "asdf"
    @State private var currIngredient: Int = 0
    
    func UpdateCurrentIngredient(index:Int) {
        currIngredient = index
    }
    
    var body: some View {
        VStack{
            TextField("test", text: $testInput)
            Text("Hello \(testInput) \(testResult)")
            HStack{
                Menu("Convert from:") {
                    ForEach(units.indices, id: \.self) {index in
                        Button(units[index], action: {
                            print("foo")
                        })
                    }
                }
                Menu("Convert to:") {
                    ForEach(units.indices, id: \.self) {index in
                        Button(units[index], action: {
                            print("bar")
                        })
                    }
                }
            }
            Menu("Test Menu") {
                ForEach(densities.indices, id: \.self) {index in
                    Button(densities[index].ingredient, action: {
                        testResult = updateDensityCalc(val: testInput, inputUnit: "g", outputUnit: "ml", density: densities[index].density)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
