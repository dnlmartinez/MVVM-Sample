//
//  Constants.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import Foundation


public typealias onCharacters = ([CharacterModel]) -> Void
public typealias onError = (Error?) -> Void


struct Fonts {
    static let sf_round_black = "SFCompactRounded-Black"
}

struct Views {
    
    struct MainView{
        static let title = "Marvel Characters"
        static let lottieFile = "loader"
        static let toastDescription = "Fetching characters ..."
    }
    
    struct DetailView{
        static let placeholderImg = "marvel"
    }
    
    struct RowView{
        static let placeholderImg = "marvel"
    }
}

struct EndPoints{
    
    static let base = "https://gateway.marvel.com:443/v1/public"
    
    //TODO: Update values in the Config.plist file
    
    static func publicKey()->String{
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) ,let value = dict["publicKey"] as? String, value != "PUBLIC API KEY"{
                return value
            }
        }
        fatalError("Missing publicKey in the info.plist file.")
    }


    static func privateKey()->String{
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) ,let value = dict["privateKey"] as? String, value != "PRIVATE API KEY"{
                return value
            }
        }
        fatalError("Missing privateKey in the info.plist file.")
    }
    
    struct Character{
        static let list = "/characters"
    }
    
    static func characterEndpoint(timestamp: String, hash: String)->String{
        return "/characters?limit=100&offset=\(1)&ts=\(timestamp)&apikey=\(EndPoints.publicKey())&hash=\(hash)"
    }
    
    struct http{
        static let method = "GET"
        static let value = "Application/json"
        static let header = "Content-Type"
    }
    
}

