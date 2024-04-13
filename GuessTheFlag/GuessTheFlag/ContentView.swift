//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yenleng Tan on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var userScore = 0
//    @State private var tappedCountry = ""
    @State private var count = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            RadialGradient(stops:[.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag that shows")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) {
                        number in
                        Button{
                            flagTapped(number)
//                            tappedCountry = countries[number]
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 7)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
       
    }
    func flagTapped(_ number : Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
            count += 1
        } else {
            scoreTitle = "Wrong, thats the state of \(countries[number])"
            count += 1
           
            if (userScore > 0) {
                userScore -= 1
                
            }
            
        }
        showScore = true
    }
    func askQuestion (){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restart() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        count = 0
        userScore = 0
    }
}
    

#Preview {
    ContentView()
}
