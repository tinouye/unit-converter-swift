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
    var testAr: [String] = ["Apple", "Banana", "Cherry", "Durian"]
    var body: some View {
        VStack{
            TextField("test", text: $testInput)
            Text("Hello \(testInput)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
