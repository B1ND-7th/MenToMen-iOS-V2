/// Text Field
/// Created by Mercen on 2022/12/20.

import SwiftUI

enum TextFieldType {
    case normal
    case secure
}

// MARK: - Custom Text Field
struct CustomTextField: View {
    
    /// Namespaces
    @Namespace private var animation
    
    /// Bindings
    @Binding var text: String
    @Binding var retry: Bool
    
    /// State Variables
    @FocusState private var focus: Bool
    @State private var animatedText: String = String()
    
    /// Static & Local Variables
    let placeholder: String
    var type: TextFieldType?
    
    /// Local Functions
    private func changeText() {
        withAnimation(.default) {
            retry = false
        }
        withAnimation(.easeInOut(duration: 0.2)) {
            animatedText = text
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            // MARK: - Placeholder
            if !animatedText.isEmpty {
                Text(placeholder)
                    .scaleEffect(0.7, anchor: .leading)
                    .foregroundColor(focus ? .accentColor : Color.gray)
                    .matchedGeometryEffect(id: "text", in: animation)
            }
            
            // MARK: - Text Field
            ZStack(alignment: .leading) {
                if animatedText.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .matchedGeometryEffect(id: "text", in: animation)
                }
                switch(type) {
                case .secure:
                    SecureField("", text: $text)
                        .focused($focus)
                default:
                    TextField("", text: $text)
                        .focused($focus)
                        .autocapitalization(.none)
                }
            }
            .onChange(of: text) { _ in changeText() }
            
            // MARK: - Line
            Rectangle()
                .fill(focus ? .accentColor : Color.gray)
                .frame(height: 1.3)
                .padding(.top, 10)
        }
        .font(.title3)
        .frame(height: 70)
    }
}
