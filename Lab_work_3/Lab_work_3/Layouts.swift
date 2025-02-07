import SwiftUI

// MARK: - Linear Layout (Аналог LinearLayout)
struct LinearLayoutView: View {
    var body: some View {
        HStack(spacing: 15) {
            Button("Left") {}
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
            
            Button("Center") {}
                .frame(width: 100)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
            
            Button("Right") {}
                .frame(width: 50)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
        }
        .padding()
    }
}

// MARK: - Table Layout (Аналог TableLayout)
struct TableLayoutView: View {
    @State private var items = [
        (name: "Milk", bought: false),
        (name: "Bread", bought: false),
        (name: "Eggs", bought: false)
    ]
    
    var body: some View {
        List {
            HStack {
                Text("Продукты").bold()
                Spacer()
                Text("Куплено").bold()
            }
            
            ForEach(0..<items.count, id: \.self) { index in
                HStack {
                    Text(items[index].name)
                    Spacer()
                    Toggle("", isOn: $items[index].bought)
                        .labelsHidden()
                }
                .padding(.vertical, 5)
            }
        }
        .padding()
    }
}

// MARK: - Frame Layout (Аналог FrameLayout)
struct FrameLayoutView: View {
    var body: some View {
        ZStack {
            Button("Center") {}
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .position(x: 200, y: 400)
            
            Button("Top Left") {}
                .position(x: 50, y: 50)
            
            Button("Top Right") {}
                .position(x: 350, y: 50)
            
            Button("Bottom Left") {}
                .position(x: 50, y: 750)
            
            Button("Bottom Right") {}
                .position(x: 350, y: 750)
        }
    }
}

// MARK: - Relative Layout (Аналог RelativeLayout)
struct RelativeLayoutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Регистрация")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            Text("Имя")
            TextField("Введите имя", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("E-mail")
            TextField("Введите e-mail", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Пароль")
            SecureField("Введите пароль", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Зарегистрироваться") {}
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
}

// MARK: - Constraint Layout (Аналог ConstraintLayout)
struct ConstraintLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("custom_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                Image("corner_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x: 50, y: 50)
                
                Image("corner_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x: geometry.size.width - 50, y: 50)
                
                Image("corner_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x: 50, y: geometry.size.height - 50)
                
                Image("corner_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .position(x: geometry.size.width - 50, y: geometry.size.height - 50)
            }
        }
    }
}

// MARK: - Grid Layout (Аналог GridLayout)
struct GridLayoutView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            Text("Продукты").bold()
            Text("Куплено").bold()
            
            Text("Milk")
            Toggle("", isOn: .constant(false))
            
            Text("Bread")
            Toggle("", isOn: .constant(false))
            
            Text("Eggs")
            Toggle("", isOn: .constant(false))
        }
        .padding()
    }
}

// MARK: - Программный Layout (Аналог ProgrammaticLayout)
struct ProgrammaticLayoutView: View {
    var body: some View {
        VStack {
            Text("Регистрация (программно)")
                .font(.title)
                .bold()
            
            TextField("Имя", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("E-mail", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Пароль", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Зарегистрироваться") {}
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
}

// MARK: - Combined Layout (Объединение форм)
struct CombinedLayoutView: View {
    var body: some View {
        VStack(spacing: 20) {
            RelativeLayoutView()
            Divider()
            TableLayoutView()
        }
        .padding()
    }
}
