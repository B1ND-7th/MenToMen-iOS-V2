/// Base View
/// Created by Mercen on 2022/12/20.

import SwiftUI

// MARK: - Base View
struct BaseView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
