//
//  ContentView.swift
//  WeSplitv2
//
//  Created by Yenleng Tan on 24/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var focusAmount : Bool
    @State private var showBreakdown : Bool = false
    let tips = [9, 0]
    
    var totalPerPerson : Double {
        // calculate cost per person
        let peopleCount = Double(numPeople+2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let total = checkAmount + tipValue
        let amtPerPerson = total / peopleCount
        return amtPerPerson
    }
    
 
    var body: some View {
       
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($focusAmount)
                    
                    Picker("Number of people", selection: $numPeople){
                        ForEach(2..<11){
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }
                
                Section("Is there GST?"){
                    
         
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tips, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Each person pays"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if focusAmount {
                    Button ("Done"){
                        focusAmount = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
