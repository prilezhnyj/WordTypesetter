//
//  GameView.swift
//  WordTypesetter
//
//  Created by Максим Боталов on 18.09.2022.
//

import SwiftUI

let widthScreen = UIScreen.main.bounds

struct GameView: View {
    
    @State private var collectedWord = ""
    @Environment(\.presentationMode) var presentationMode
    
    var viewModel: GameViewModel?
    
    var body: some View {
        
        
        
        VStack(spacing: 40) {
            
            HStack {
                Spacer()
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                    Text("Закрыть игру")
                }
            }
            
            Spacer()
            
            Text(viewModel?.word ?? "")
                .font(.largeTitle).bold()
            
            HStack(spacing: 8) {
                VStack {
                    Text("\(viewModel?.userOne.totla ?? 0)")
                        .font(.largeTitle).bold()
                    Text(viewModel?.userOne.name ?? "")
                }
                .frame(width: widthScreen.width / 2 - 16, height: widthScreen.width / 2 - 16)
                .background(Color.gray)
                
                VStack {
                    Text("\(viewModel?.userTwo.totla ?? 0)")
                        .font(.largeTitle).bold()
                    Text(viewModel?.userTwo.name ?? "")
                }
                .frame(width: widthScreen.width / 2 - 16, height: widthScreen.width / 2 - 16)
                .background(Color.gray)
            }
            
            TextField("Введите ваше слово", text: $collectedWord).textFieldStyle(.roundedBorder)
            
            Button {
                let total = viewModel?.check(word: collectedWord)
                
                if total! > 1  {
                    self.collectedWord = ""
                }
            } label: {
                Text("Готово")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color.green, radius: 5, x: 0, y: 4)
            }
            
            Spacer()
        }.padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
