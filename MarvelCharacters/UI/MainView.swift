//
//  MainView.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import SwiftUI
import AlertToast

struct MainView<Source: ProtocolDataSource>: View {
    
    @ObservedObject var dataSource: Source
    @State private var searchText = ""
    @State private var showToast: Bool = false
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.65)
            
            VStack{
                if dataSource.characters.count > 0{
                    NavigationStack {
                        List {
                            ForEach(searchResults) { character in
                                NavigationLink(destination: DetailView(character: character)){
                                    CharacterRowView(character: character)
                                }
                                .navigationBarTitle(Views.MainView.title)
                                .navigationBarHidden(false)
                            }
                        }
                    }
                    .padding(.top, -10)
                    .searchable(text: $searchText)
                }else{
                    Loadingview(fileName: Views.MainView.lottieFile)
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
        .toast(isPresenting: $showToast){
            AlertToast(displayMode: .banner(.slide), type: .regular, title: Views.MainView.toastDescription)
        }
        .onAppear{
            self.loadCharacters()
        }
    }
    
    var searchResults: [CharacterModel] {
        if searchText.isEmpty {
            return dataSource.characters
        } else {
            return dataSource.characters.filter { $0.name.contains(searchText) }
        }
    }
    
    func loadCharacters(){
        showToast = true
        dataSource.load(completion: nil, failure: nil)
    }
}
