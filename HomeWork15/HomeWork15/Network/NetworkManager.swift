//
//  ArticleManager.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func loadArticles(result: @escaping (Result<[Article], Error>) -> Void) {
        
        let url = "https://jsonplaceholder.typicode.com/posts".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(url).responseData { response in
            
            switch response.result {
                
            case .success(let data):
                
                do {
                    
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                   
                    result(.success(articles))
                    
                } catch {
                    result(.failure(error))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    
    func loadAlbums(result: @escaping (Result<[Album], Error>) -> Void) {
        
        let url = "https://jsonplaceholder.typicode.com/users/1/albums".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(url).responseData { response in
            
            switch response.result {
                
            case .success(let data):
                
                do {
                    
                    let album = try JSONDecoder().decode([Album].self, from: data)
                    
                    
                    result(.success(album))
                    
                } catch {
                    result(.failure(error))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    
    func loadPhoto(result: @escaping (Result<[Photo], Error>) -> Void) {
        
        let url = "https://jsonplaceholder.typicode.com/albums/1/photos".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(url).responseData { response in
            
            switch response.result {
                
            case .success(let data):
                
                do {
                    
                    let photo = try JSONDecoder().decode([Photo].self, from: data)
                    
                    
                    result(.success(photo))
                    
                } catch {
                    result(.failure(error))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    
}

