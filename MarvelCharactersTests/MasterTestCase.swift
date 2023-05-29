//
//  MasterTestCase.swift
//  MarvelCharactersTests
//
//  Created by daniel martinez gonzalez on 29/5/23.
//


import Foundation
import XCTest


class MasterTestCase: XCTestCase{
    
    typealias ExecuteTestBlock = (_ model:CharacterViewModel) -> Void
    typealias ErrorBlock = (_ error:Error) -> Void
    typealias SuccessBlock = () -> Void
        
    func prepareNetwork(test: String, mock: NetworkService, expectations: [XCTestExpectation], waitExpectation:Bool = true, timeout: Double = 10, execute: @escaping ExecuteTestBlock){
        
        DispatchQueue.init(label: test).async{
            
            let model = CharacterViewModel()
            InjectedValues[\.network] = mock
            execute(model)
        }
        
        if waitExpectation{
            wait(for: expectations, timeout: timeout)
        }
        
    }
    
}
