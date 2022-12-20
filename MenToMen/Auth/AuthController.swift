/// Auth Controller
/// Created by Mercen on 2022/12/20.

import Foundation

enum TokenType {
    case accessToken
    case refreshToken
}

func getToken(_ tokenType: TokenType) -> String? {
    return UserDefaults.standard.string(forKey: String(describing: tokenType))
}

func saveToken(_ tokenType: TokenType, _ value: String) {
    UserDefaults.standard.set(value, forKey: String(describing: tokenType))
}
