//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yenleng Tan on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
       
//            Text("Hello, SwiftUI!")
//                
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .foregroundStyle(.white)
//                .background(.red.gradient)
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Important!", isPresented: $showAlert){
            Button("Delete", role: .destructive){
            }
            Button("Cancel", role: .cancel){}
        }message: {
            Text("Read this message")
        }
        
  
    }
}

#Preview {
    ContentView()
}
