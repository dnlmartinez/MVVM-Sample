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
    
    //TODO: change to info.plist
    static let publicKey = "0e2cccec47efe7a7d6de39ce54f4360a"
    static let privateKey = "89a3d0efb57c1d02cc46e982f6b3770eced697dd"
    
    struct Character{
        static let list = "/characters"
    }
    
    static func characterEndpoint(timestamp: String, hash: String)->String{
        return "/characters?limit=100&offset=\(1)&ts=\(timestamp)&apikey=\(EndPoints.publicKey)&hash=\(hash)"
    }
    
    struct http{
        static let method = "GET"
        static let value = "Application/json"
        static let header = "Content-Type"
    }
    
}

