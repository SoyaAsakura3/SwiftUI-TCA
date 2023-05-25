//
//  PostListView.swift
//  SwiftUI-TCA
//
//  Created by s.asakura on 2023/05/25.
//

import SwiftUI
import ComposableArchitecture


struct PostListView: View {
    let store: Store<PostListState, PostListAction>

        var body: some View {
            WithViewStore(self.store) { viewStore in

                List {
                    ForEach(viewStore.posts) { post in
                        Text(post.title)
                    }
                }
                
                .onAppear {
                    viewStore.send(.fetchPosts)
                }
            }
        }
}
