//
//  QiitaCustomError.swift
//  SwiftUI-TCA
//
//  Created by s.asakura on 2023/05/25.
//

import Foundation

enum QiitaCustomError: Error , Equatable{
    static func == (lhs: QiitaCustomError, rhs: QiitaCustomError) -> Bool {
        return true
    }
    
    // Alamofireのエラー（デコード、タイムアウトなどURLSession関連のエラー全般）
    case apiClientError(Error)

    // 独自のエラーメッセージを表示したいケースで使用（errorが取れないguard箇所など）
    case manualError(String)

    var title: String {
        switch self {

        default:
            return "エラーが発生しました"
        }
    }

    var message: String? {
        switch self {
        default:
            return nil
        }
    }

}

