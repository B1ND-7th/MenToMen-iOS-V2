/// Responses
/// Created by Mercen on 2022/12/20.

import Foundation

class Response<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
