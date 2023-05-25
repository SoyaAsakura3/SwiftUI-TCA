//
//  QiitaAPIClient.swift
//  SwiftUI-TCA
//
//  Created by s.asakura on 2023/05/25.
//

import Foundation
import Combine
import ComposableArchitecture
import Alamofire

struct QiitaAPIClient {
    
    func fetchItems() -> Effect<[Post], QiitaCustomError> {
        return Effect.future { promise in
            let url = "https://qiita.com/api/v2/items"
            
            AF.request(url).responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    promise(.success(posts))
                case .failure(let error):
                    promise(.failure(QiitaCustomError.apiClientError(error)))
                }
            }
        }
    }
}

