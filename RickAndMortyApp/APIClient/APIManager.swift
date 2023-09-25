//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Элина on 24.09.2023.
//

import UIKit

class APIManager {
    func loadImage(id: Int, completion: @escaping(UIImage?) ->()) {
        guard let url = URL(string: urlString + "\(id)")
        else {
            print("fail")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data, let rmCharacter = try? JSONDecoder().decode(RMCharacter.self, from: data) {
                self.loadImageContent(url: rmCharacter.url, completion: completion)
                print(rmCharacter.url)
        }
    }
    task.resume()
}
    private func loadImageContent(url: String, completion: @escaping(UIImage?) ->()) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            if let data, let image = UIImage(data: data) {
                completion(image)
                print("image")
            } else {
               completion(nil)
                print("fail")
            }
            
        }
        task.resume()
    }
    
    
    private let urlString = "https://rickandmortyapi.com/api/character/"
}


