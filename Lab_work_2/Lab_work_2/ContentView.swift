import SwiftUI

struct ContentView: View {
    @State private var userAnswer: String = ""
    @State private var isCorrect: Bool = false
    @State private var navigateToWin = false
    @State private var navigateToLose = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()

                Text("2 + 2 = ?")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hex: "#3A4856"))
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity, alignment: .center)

                TextField("Напиши ответ", text: $userAnswer)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)

                Button(action: {
                    if let answer = Int(userAnswer), answer == 4 {
                        navigateToWin = true
                    } else {
                        navigateToLose = true
                    }
                }) {
                    Text("Проверить")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#3CC08E"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                }
                .padding(.bottom, 24)

                Spacer()

                NavigationLink("", destination: WinView(), isActive: $navigateToWin)
                NavigationLink("", destination: LoseView(), isActive: $navigateToLose)
            }
            .padding(.horizontal)
            .background(Color(UIColor.systemGroupedBackground))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
