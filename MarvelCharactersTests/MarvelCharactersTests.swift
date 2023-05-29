//
//  MarvelCharactersTests.swift
//  MarvelCharactersTests
//
//  Created by daniel martinez gonzalez on 29/5/23.
//

import XCTest
import XCTest


class MarvelCharactersTests:MasterTestCase {
    
    func test0001_requestCharacters(){
        
        let expectation = self.expectation(description: "Waiting a valid response.")
        
        class networkMock: NetworkService{
            override func retrieveCharacters(completion: @escaping onCharacters, failure: @escaping onError){
                let list: [CharacterModel] = [CharacterModel(id: 123, name: "tester1", characterDescription: "", resourceURI: "", artwork: nil)]
                completion(list)
            }
        }
        
        self.prepareNetwork(test: #function, mock: networkMock(), expectations: [expectation], execute: { viewModel in
            viewModel.load(completion: { characters in
                XCTAssertEqual(characters.count, 1)
                expectation.fulfill()
            }, failure:{ error in
                XCTFail()
                expectation.fulfill()
            })
        })

    }
    
    
    func test0002_requestCharacters_failure(){
        
        let expectation = self.expectation(description: "Waiting a valid response.")
        
        class networkMock: NetworkService{
            override func retrieveCharacters(completion: @escaping onCharacters, failure: @escaping onError){
                failure(nil)
            }
        }
        
        self.prepareNetwork(test: #function, mock: networkMock(), expectations: [expectation], execute: { viewModel in
            viewModel.load(completion: { characters in
                XCTFail()
                expectation.fulfill()
            }, failure:{ error in
                if let e = error{
                    XCTFail()
                }
                expectation.fulfill()
            })
        })

    }
    
}
