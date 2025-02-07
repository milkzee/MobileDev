import SwiftUI

struct ContentView: View {
    @State private var isShowingMessageView = false
    @State private var message = ""

    var body: some View {
        NavigationStack {
            LoginView(onLoginSuccess: { loginMessage in
                message = loginMessage
                isShowingMessageView = true
            })
            .navigationTitle("Вход")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isShowingMessageView) {
                MessageView(message: message)
            }
        }
    }
}
