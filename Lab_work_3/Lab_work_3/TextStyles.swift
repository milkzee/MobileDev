import SwiftUI

struct CustomTextStyle: ViewModifier {
    var fontSize: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize, weight: .bold, design: .monospaced))
            .foregroundColor(.black)
    }
}

extension View {
    func customText(fontSize: CGFloat) -> some View {
        self.modifier(CustomTextStyle(fontSize: fontSize))
    }
}
