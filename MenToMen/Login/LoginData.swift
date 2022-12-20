/// Login Data
/// Created by Mercen on 2022/12/20.

struct CodeData: Codable {
    let name: String
    let profileImage: String?
    let location: String
}

struct AuthData: Codable {
    let accessToken: String
    let refreshToken: String
}
