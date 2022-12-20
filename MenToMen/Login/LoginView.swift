/// Login View
/// Created by Mercen on 2022/12/20.

import SwiftUI

// MARK: - Login View
struct LoginView: View {
    
    /// State Variables
    @State private var auth: Bool = false
    @State private var retry: Bool = false
    
    @State private var loginId: String = String()
    @State private var loginPw: String = String()
    @State private var error: String = String()
    
    @State private var invalid: Int = 0
    
    // MARK: - Invalid Animation
    func invalid(_ message: String) {
        HapticManager.instance.notification(type: .error)
        error = message
        withAnimation(.default) {
            auth = false
            retry = true
            invalid += 1
        }
    }
    
    // MARK: - Start Login
    func startAuth() {
        auth = true
        fetchCode(loginId: loginId, loginPw: loginPw) { response in
            switch response.result {
            case .success:
                fetchAuth(code: decodeCode(response)) { response in
                    switch response.result {
                    case .success:
                        completeAuth(response)
                    case .failure:
                        invalid("서버에 연결할 수 없습니다")
                    }
                }
            case .failure:
                invalid("ID 또는 비밀번호가 틀렸습니다")
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: - Logo
            Image("M2MLogo")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.accentColor)
                .scaledToFit()
                .frame(width: 250)
            
            // MARK: - Text Fields
            VStack(alignment: .leading) {
                CustomTextField(text: $loginId, retry: $retry, placeholder: "도담도담 ID")
                CustomTextField(text: $loginPw, retry: $retry, placeholder: "비밀번호", type: .secure)
                if invalid != 0 && retry {
                    Text(error)
                        .foregroundColor(.accentColor)
                        .padding(.top, 5)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .modifier(ShakeEffect(animatableData: CGFloat(invalid)))
            
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
            .padding(.top, 40)
        }
        .frame(maxWidth: 500)
        .padding(30)
    }
}
