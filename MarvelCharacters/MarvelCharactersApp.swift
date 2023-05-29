//
//  MarvelCharactersApp.swift
//  MarvelCharacters
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import SwiftUI

@main
struct MarvelCharactersApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainView(dataSource: CharacterViewModel())
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}
