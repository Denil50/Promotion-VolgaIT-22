//
//  ApiCaller.swift
//  Promotion VolgaIT’22
//
//  Created by Apple on 06.04.2022.
//

import Foundation

final class NomicsAPICaller {
    static let shared = NomicsAPICaller()
    
    private struct Constants {
        static let apiKey = "65d826b99ad9177574292332ff03b21ca80d24b6"
        static let assetsEnpoint = "https://api.nomics.com/v1/currencies/"
    }
    
    private init() {
        
    }
    
    public func getAllCryptoDate (
        complition: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        guard let url = URL(string: Constants.assetsEnpoint + "ticker?key=" + Constants.apiKey + "&ranks=1&interval=1d,30d&convert=USD&per-page=10&page=1") else {
            return
        }
    let task = URLSession.shared.dataTask(with: url) {data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            //Decode
            let jsonResult = try JSONDecoder().decode([Crypto].self, from: data)
            complition(.success(jsonResult))
        }
        catch {
            complition(.failure(error))
        }
    }
        task.resume()
  }
}


