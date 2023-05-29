//
//  CharacterViewModel.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import Foundation

class CharacterViewModel: ObservableObject{
    @Injected(\.network)  private var network: NetworkService
    @Published var characterList: [CharacterModel] = [CharacterModel]()
}


extension CharacterViewModel: ProtocolDataSource {
    
    
    /// Character list
    var characters: [CharacterModel] {
        return self.characterList
    }
    
    
    /// A Counter from a character list
    var counter: Int {
        return self.characterList.count
    }
    
    
    /// Get a character in the list by position
    /// - Parameter index: position in the list
    /// - Returns: a CharacterModel in the list
    func character(for index: Int) -> CharacterModel{
        return self.characterList[index]
    }

    
    /// Fetch a list of character from 1 to 100
    /// - Parameters:
    ///   - completion: a list of characters
    ///   - failure: error with description
    func load(completion: onCharacters? = nil, failure: onError? = nil){
        network.retrieveCharacters { characters in
            
            if let cb = completion{
                cb(characters)
            }
            
            DispatchQueue.main.async { self.characterList = characters }
            
        } failure: { error in
            if let cb = failure{
                cb(error)
            }
        }
    }

    
    
    
}


