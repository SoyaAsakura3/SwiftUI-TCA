//
//  SwiftUI_TCAApp.swift
//  SwiftUI-TCA
//
//  Created by s.asakura on 2023/05/22.
//

import SwiftUI
import ComposableArchitecture
            
@main
struct SwiftUI_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            PostListView(
                store: Store(
                    initialState: PostListState(),
                    reducer: PostListReducer,
                    environment: PostListEnvironment(qiitaAPIClient: QiitaAPIClient())
                )
            )
        }
    }
}
