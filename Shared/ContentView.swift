//
//  ContentView.swift
//  Shared
//
//  Created by Media Room on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var testInput: String = "20"
    @State private var testResult: String = "asdf"
    @State private var currIngredient: Int = 0
    var testAr: [String] = ["Apple", "Banana", "Cherry", "Durian"]
    
    func UpdateCurrentIngredient(index:Int) {
        currIngredient = index
    }
    
    var body: some View {
        VStack{
            TextField("test", text: $testInput)
            Text("Hello \(testInput) \(testResult)")
            Menu("Test Menu") {
                ForEach(testAr.indices, id: \.self) {index in
                    Button(testAr[index], action: {
                        currIngredient = index
                        testResult = testAr[index]
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
