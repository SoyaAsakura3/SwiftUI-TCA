//
//  PostListCore.swift
//  SwiftUI-TCA
//
//  Created by s.asakura on 2023/05/25.
//

import ComposableArchitecture
import Alamofire
import Foundation

struct PostListCancelId: Hashable {}

struct PostListState: Equatable {
    
    var posts: [Post] = []
}

enum PostListAction {
    case fetchPosts
    case receivePosts(Result<[Post], QiitaCustomError>)
    case setItems([Post])
    
}

struct PostListEnvironment {
    var qiitaAPIClient: QiitaAPIClient
//    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let PostListReducer = Reducer<PostListState, PostListAction, PostListEnvironment> { state, action, environment in
    switch action {
        
    case .fetchPosts:
        return environment.qiitaAPIClient
            .fetchItems()
            .catchToEffect()
            .map(PostListAction.receivePosts)
        
    case let .receivePosts(.success(posts)):
        state.posts = posts
        return .none
        
    case let .receivePosts(.failure(_)):
        return .none
    case .setItems(let posts):
        state.posts = posts
        return .none
    }
}

