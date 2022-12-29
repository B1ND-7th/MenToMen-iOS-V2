/// Base View
/// Created by Mercen on 2022/12/20.

import SwiftUI

// MARK: - Base View
struct BaseView: View {
    var body: some View {
        if getToken(.accessToken) == nil {
            LoginView()
                .zIndex(2)
        } else {
            
        }
    }
}
