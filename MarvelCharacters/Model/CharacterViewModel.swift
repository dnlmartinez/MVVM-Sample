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
    
    var characters: [CharacterModel] {
        return self.characterList
    }
    
    var counter: Int {
        return self.characterList.count
    }
    
    func character(for index: Int) -> CharacterModel{
        return self.characterList[index]
    }

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


