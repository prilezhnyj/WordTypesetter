//
//  ContentView.swift
//  WordTypesetter
//
//  Created by Максим Боталов on 18.09.2022.
//

import SwiftUI

struct StartView: View {
    @State private var originalWord = ""
    @State private var namePlayerOne = ""
    @State private var namePlayerTwo = ""
    
    @State private var isTransition = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Сборщик слов")
                .font(.largeTitle).bold()
            
            VStack(alignment: .leading, spacing: 10) {
                TextField("Введите исходное слово", text: $originalWord)
                    .textFieldStyle(.roundedBorder)
                TextField("Имя первого игрока", text: $namePlayerOne)
                    .textFieldStyle(.roundedBorder)
                TextField("Имя второго игрока", text: $namePlayerTwo)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button {
                self.isTransition.toggle()
            } label: {
                Text("Начать игру")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color.green, radius: 5, x: 0, y: 4)
            }
            .fullScreenCover(isPresented: $isTransition) {
                GameView(viewModel: GameViewModel(userOne: UserModel(name: namePlayerOne, totla: 0), userTwo: UserModel(name: namePlayerTwo, totla: 0), word: "Безопасность"))
            }

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
