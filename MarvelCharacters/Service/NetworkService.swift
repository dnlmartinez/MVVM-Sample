//
//  NetworkService.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 26/5/23.
//


import Foundation
import CryptoKit


/// Network protocol
protocol NetworkServiceSource{
    func retrieveCharacters(completion: @escaping onCharacters, failure: @escaping onError)
}


class NetworkService: NetworkServiceSource {
    
    /// Retrieve character from  https://developer.marvel.com
    /// - Parameters:
    ///   - completion: List of character from 1 to 100
    ///   - failure: Error with a bit description
    func retrieveCharacters(completion: @escaping onCharacters, failure: @escaping onError){
        
        guard let serviceUrl = URL(string: self.getURL()) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = EndPoints.http.method
        request.setValue(EndPoints.http.value, forHTTPHeaderField: EndPoints.http.header)
        request.timeoutInterval = 20
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error{
                failure(error)
            }
            else if let data = data{
                do{
                    let result = try JSONDecoder().decode(DataCharacterModels.self, from: data)
                    completion(result.data.results)
                }catch let error{
                    failure(error)
                }
            }else{
                //TODO: Error Factory
            }
            
        }.resume()
    }
    
}


extension NetworkService{
    
    
    /// Hash md5
    /// - Parameter string: timestamp + private_key + public_key
    /// - Returns: a formatted url in string
    private func md5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    
    /// Get the fetch url with a paginatio 1 to 100
    /// - Returns: a formatted url in string
    private func getURL()->String{
        let timestamp = String.localizedStringWithFormat("%i", Date().timeIntervalSince1970)
        let hash = md5(string: timestamp + EndPoints.privateKey() + EndPoints.publicKey())
        let charactersEndpoint = EndPoints.characterEndpoint(timestamp: timestamp, hash: hash)
        return EndPoints.base + charactersEndpoint
    }
    
}
    
