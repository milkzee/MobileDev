import SwiftUI

struct ContentView: View {
    @StateObject private var themeManager = ThemeManager()

    var body: some View {
        ZStack {
            themeManager.selectedTheme.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker("Выберите тему", selection: $themeManager.selectedTheme) {
                    ForEach(AppTheme.allCases, id: \.self) { theme in
                        Text(theme.rawValue.capitalized)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(themeManager.selectedTheme.cardBackground)
                .clipShape(Capsule())
                .shadow(radius: 2)

                TabView {
                    LinearLayoutView()
                        .tabItem { Label("Linear", systemImage: "square.grid.2x2") }

                    TableLayoutView()
                        .tabItem { Label("Table", systemImage: "list.bullet") }

                    FrameLayoutView()
                        .tabItem { Label("Frame", systemImage: "square") }

                    RelativeLayoutView()
                        .tabItem { Label("Relative", systemImage: "rectangle") }

                    ConstraintLayoutView()
                        .tabItem { Label("Constraint", systemImage: "photo") }

                    GridLayoutView()
                        .tabItem { Label("Grid", systemImage: "square.grid.3x3") }

                    ProgrammaticLayoutView()
                        .tabItem { Label("Programmatic", systemImage: "hammer") }

                    CombinedLayoutView()
                        .tabItem { Label("Combined", systemImage: "square.stack.3d.up") }
                }
                .accentColor(themeManager.selectedTheme.textColor)
                .padding(.top, 20)
            }
            .padding()
        }
        .environmentObject(themeManager)
        .preferredColorScheme(themeManager.selectedTheme.colorScheme)
    }
}
