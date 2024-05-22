//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Yenleng Tan on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var compChoice = ["✊", "✋", "✌️"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var condition: String = ""
    @State private var finalAns: Int = 0
    @State private var score: Int = 0
    @State private var showAlert = false
    @State private var isBounce = [false, false, false]
    
    init() {
        let compPrompt = ["Win", "Lose"].shuffled()
        let correctAnswer = Int.random(in: 0...1)
        _condition = State(initialValue: compPrompt[correctAnswer])
        _finalAns = State(initialValue: 0)
    }

    var body: some View {
        ZStack{
            
            LinearGradient(stops: [
                .init(color: .teal, location: 0.25),
                .init(color: .mint, location: 0.8) // Use Color(hex:)
              ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                Image(systemName: "gamecontroller.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text(condition)
                    .onAppear(){
                        finalAns = correctAnswer
                    }
                    .font(.system(size: 30))
                Text("Computer Choice: \(compChoice[finalAns])")
                    .font(.system(size: 30))
                Text("Score: \(score)")
                    .font(.system(size: 30))
                Spacer()
                
                ForEach(0..<3) { number in
                    Button(action: {
                        userTapped(number)
                    }) {
                        Text(compChoice[number])
                            .font(.system(size: 40))
                            .symbolEffect(.bounce, value: isBounce[number])
                    }
                    .frame(minWidth: 100, minHeight: 70)
                    .onAppear { // Initialize bounce state for each button on appear
                               isBounce[number] = false
                             }
                }
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Congratulations"),
                    message: Text("You've won the game!"),
                    dismissButton: .default(Text("OK")) {
                        resetGame()
                    }
                )
            }
            
        }
        
    }
    
    func deduct() {
        if score > 0 {
            score -= 1
        }
    }
    
    func askQuestion() {
        let compPrompt = ["Win", "Lose"].shuffled()
        let promptInt = Int.random(in: 0...1)
        condition = compPrompt[promptInt]
        finalAns = Int.random(in: 0...2)
        if score == 5 {
            showAlert = true
        }
    }
    
    func resetGame(){
        let compPrompt = ["Win", "Lose"].shuffled()
        let promptInt = Int.random(in: 0...1)
        condition = compPrompt[promptInt]
        finalAns = Int.random(in: 0...2)
        correctAnswer = Int.random(in: 0...2)
        score = 0
    }

    func userTapped(_ number: Int) {
        print("Button \(number) tapped")
        print("Comp Answer = \(finalAns)")
        if condition == "Win" && ((finalAns == 0 && number == 1) || (finalAns == 1 && number == 2) || (finalAns == 2 && number == 0)) {
            print("Win")
            score += 1
            askQuestion()
        } else if (condition == "Lose" && ((finalAns == 0 && number != 1) || (finalAns == 1 && number != 2) || (finalAns == 2 && number != 0))) {
            print("Win")
            score += 1
            askQuestion()
        } else {
            print("Lose")
            deduct()
            askQuestion()
        }
    }
}

#Preview {
    ContentView()
}
