//
//  GameViewModel.swift
//  WordTypesetter
//
//  Created by Максим Боталов on 18.09.2022.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var userOne: UserModel
    @Published var userTwo: UserModel
    @Published var words = [String]()
    
    let word: String
    var isCheckUser = true
    
    init(userOne: UserModel, userTwo: UserModel, word: String) {
        self.userOne = userOne
        self.userTwo = userTwo
        self.word = word.lowercased()
    }
    
    private func validate(word: String) -> Bool {
        guard word.lowercased() != self.word else {
            print("Это сиходное слово")
            return false
        }
        
        guard !(word.contains(word.lowercased())) else {
            print("Такое слово уже было")
            return false
        }
        
        guard word.count > 1 else {
            print("Слово должно содержать как минимум две буквы")
            return false
        }
        return true
    }
    
    private func wordToChars(word: String) -> [Character] {
        var chars = [Character]()
        
        for i in word.lowercased() {
            chars.append(i)
        }
        
        return chars
    }
    
    func check(word: String) -> Int {
        guard self.validate(word: word) == true else {
            return 0
        }
        
        var originalWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        
        var result = ""
        
        for char in smallWordArray {
            if originalWordArray.contains(char) {
                result.append(char)
                var i = 0
                while originalWordArray[i] != char {
                    i += 1
                }
                originalWordArray.remove(at: i)
            } else {
                print("Слово не может быть составленно")
                return 0
            }
        }
        
        guard result == word.lowercased() else {
            print("Ошибка")
            return 0
        }
        
        words.append(result)
        
        if isCheckUser == true {
            userOne.totla += result.count
        } else {
            userTwo.totla += result.count
        }
        
        isCheckUser.toggle()
        
        return result.count
    }
}
