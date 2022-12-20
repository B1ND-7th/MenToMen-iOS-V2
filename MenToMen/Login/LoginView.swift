/// Login View
/// Created by Mercen on 2022/12/20.

import SwiftUI
import AVFoundation

// MARK: - Login View
struct LoginView: View {
    
    /// State Variables
    @State var auth: Bool = false
    @State var error: Bool = false
    @State var loginId: String = ""
    @State var loginPw: String = ""
    
    // MARK: - Start Login
    func startAuth() {
        fetchCode(loginId: loginId, loginPw: loginPw) { response in
            switch response.result {
            case .success:
                fetchAuth(code: decodeCode(response)) { response in
                    switch response.result {
                    case .success:
                        completeAuth(response)
                    case .failure:
                        error = true
                    }
                }
            case .failure:
                error = true
            }
        }
    }
    
    var body: some View {
        
        // MARK: - Login Button
        Button(action: startAuth) {
            Text("로그인")
                .foregroundColor(Color(.systemBackground))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
        .disabled(loginId.isEmpty || loginPw.isEmpty || auth)
    }
}
