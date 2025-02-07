import SwiftUI

enum AppTheme: String, CaseIterable {
    case light, dark, custom

    var colorScheme: ColorScheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .custom: return .light // Можно изменить на .dark, если нужно
        }
    }

    var backgroundColor: Color {
        switch self {
        case .light:
            return Color(UIColor.systemBackground)
        case .dark:
            return Color(UIColor.darkGray)
        case .custom:
            return Color.yellow.opacity(0.2)
        }
    }

    var textColor: Color {
        switch self {
        case .light:
            return Color.primary
        case .dark:
            return Color(UIColor.lightText)
        case .custom:
            return Color.blue
        }
    }

    var buttonColor: Color {
        switch self {
        case .light:
            return Color.blue
        case .dark:
            return Color(UIColor(white: 0.2, alpha: 1))
        case .custom:
            return Color.orange
        }
    }

    var cardBackground: Color {
        switch self {
        case .light:
            return Color(UIColor.systemGray6)
        case .dark:
            return Color(UIColor(white: 0.15, alpha: 1))
        case .custom:
            return Color.yellow.opacity(0.4)
        }
    }
}

class ThemeManager: ObservableObject {
    @Published var selectedTheme: AppTheme = .light
}
