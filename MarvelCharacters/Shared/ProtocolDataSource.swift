//
//  ProtocolDataSource.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import Foundation

protocol ProtocolDataSource: ObservableObject{
    var counter: Int { get }
    var characters: [CharacterModel] { get }
    
    func character(for index: Int) -> CharacterModel
    func load(completion: onCharacters?, failure: onError?)
}
