//
//  CharacterModel.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import Foundation

struct DataCharacterModels: Codable {
    var data: ResultCharacterModels
}
    
struct ResultCharacterModels: Codable {
    var results: [CharacterModel]
}

public struct Artwork: Codable{
    let path: String
    let ext: String
    
    private enum CodingKeys : String, CodingKey {
        case path, ext = "extension"
    }
    
    public func getUri()->String{
        return path + "." + ext
    }
}



public struct CharacterModel: Codable, Identifiable{
    
    public let id: Int
    public let name: String
    public let characterDescription: String
    public let resourceURI: String
    public let artwork: Artwork?
    
    private enum CodingKeys : String, CodingKey {
        case id, name, characterDescription = "description", resourceURI, artwork = "thumbnail"
    }
    
    
    public func getUri()->String{
        if let art = self.artwork{
            return art.getUri()
        }
        return ""
    }
        
}
