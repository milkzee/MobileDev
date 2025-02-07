import SwiftUI

struct WinView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text("Правильно!")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(Color(hex: "#3A4856"))
                .padding()
                .multilineTextAlignment(.center)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("ЕЩЕ РАЗ")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#3CC08E"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
            }
            .padding(.top, 20)
            .frame(height: 60)

            Spacer()

        }
        .padding(.horizontal)
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
