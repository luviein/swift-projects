//
//  ContentView.swift
//  WeSplitv2
//
//  Created by Yenleng Tan on 24/3/24.
//

import SwiftUI

struct ContentView: View {
    let fruits = ["Apple", "Orange", "Pear"]
    @State private var selectedFruit = "Apple"
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
       
        NavigationStack{
            Form{
                Text("Hello, \(name)")
                TextField("Type in your name", text: $name)
                
                Section{
                    Picker("Select your fruit", selection: $selectedFruit){
                        ForEach(fruits, id: \.self){
                            Text($0)
                        }
                    }
                }
                Button("TapCount: \(tapCount)"){
                    tapCount += 1
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
