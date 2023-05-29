//
//  CharacterModel.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import Foundation


/// Character model object  from -> https://developer.marvel.com/characters
public struct CharacterModel: Codable, Identifiable{
    
    
    /// identifier
    public let id: Int
    
    /// Name of the character
    public let name: String
    
    
    /// A Description of the character
    public let characterDescription: String
    
    
    /// Resources
    public let resourceURI: String
    
    
    /// Character image.
    public let artwork: Artwork?
    
    
    private enum CodingKeys : String, CodingKey {
        case id, name, characterDescription = "description", resourceURI, artwork = "thumbnail"
    }
    
    
    /// Return a artwork formatted uri with path and extension
    /// - Returns: a formatted uri
    public func getUri()->String{
        if let art = self.artwork{
            return art.getUri()
        }
        return ""
    }
        
}


///  Artwork object with path and extension
public struct Artwork: Codable{
    
    /// path of the character image
    let path: String
    
    /// Extension of the image
    let ext: String
    
    private enum CodingKeys : String, CodingKey {
        case path, ext = "extension"
    }
    
    
    /// Formatted character artwork uri
    /// - Returns: a formatted character image uri
    public func getUri()->String{
        return path + "." + ext
    }
}



struct DataCharacterModels: Codable {
    var data: ResultCharacterModels
}
    
struct ResultCharacterModels: Codable {
    var results: [CharacterModel]
}
