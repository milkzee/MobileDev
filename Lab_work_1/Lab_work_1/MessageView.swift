import SwiftUI

struct MessageView: View {
    var message: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.title)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(LocalizedStringKey("back_button"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
