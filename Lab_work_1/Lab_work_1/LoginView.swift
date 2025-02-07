import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var message: String = ""
    var onLoginSuccess: (String) -> Void

    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("E-mail")
                        .font(.headline)
                        .foregroundColor(.gray)
                    TextField("Введите e-mail", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundColor(.black)
                        .placeholder(when: email.isEmpty) {
                            Text("Введите e-mail").foregroundColor(.black.opacity(1))
                        }
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Пароль")
                        .font(.headline)
                        .foregroundColor(.gray)
                    SecureField("Введите пароль", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                        .foregroundColor(.black)
                        .placeholder(when: password.isEmpty) {
                            Text("Введите пароль").foregroundColor(.black.opacity(1))
                        }
                }
                .padding(.horizontal)

                VStack(spacing: 12) {
                    Button(action: {
                        handleLogin()
                    }) {
                        Text("Войти")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .blue.opacity(0.5), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        handleSend()
                    }) {
                        Text("Отправить")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .green.opacity(0.5), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }
                
                if !message.isEmpty {
                    Text(message)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 10)
                }
            }
            .padding()
        }
    }

    private func handleLogin() {
        if email == "admin@admin.ru" && password == "123" {
            onLoginSuccess("Добро пожаловать, \(email)!")
        } else {
            message = "Ошибка авторизации."
        }
    }

    private func handleSend() {
        onLoginSuccess("Вы отправили e-mail: \(email)")
    }
}

extension View {
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow { placeholder() }
            self
        }
    }
}

