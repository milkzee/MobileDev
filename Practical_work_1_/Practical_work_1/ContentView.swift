import SwiftUI

struct ContentView: View {
    @State private var name: String = "" // Для текущего ввода
    @State private var names: [String] = [] // Список имен
    @State private var editingIndex: Int? = nil // Индекс редактируемого элемента
    @State private var message: String? = nil // Сообщение о последнем действии

    var body: some View {
        VStack(spacing: 16) {
            // Сообщение о последнем действии
            if let message = message {
                Text(message)
                    .foregroundColor(.green)
                    .padding(.bottom, 10)
            }

            // Список имен
            List {
                ForEach(names.indices, id: \.self) { index in
                    HStack {
                        if editingIndex == index {
                            TextField("Редактировать имя", text: $name)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            Button(action: {
                                editingIndex = nil
                                name = ""
                                message = "Отмена редактирования"
                            }) {
                                Text("Отмена")
                                    .foregroundColor(.red)
                            }
                            .padding(.leading, 8)
                            
                        } else {
                            Text(names[index])
                                .font(.headline)
                                .padding(.leading, 8)
                            Spacer()
                            Button(action: {
                                if index < names.count {
                                    name = names[index]
                                    editingIndex = index
                                    message = nil
                                }
                            }) {
                                Text("Изменить")
                                    .foregroundColor(.blue)
                            }
                            .padding(.trailing, 8)
                        }

                        Button(action: {
                            if index < names.count {
                                names.remove(at: index)
                                if editingIndex == index {
                                    editingIndex = nil
                                    name = ""
                                }
                                message = "Удалено"
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.vertical, 10)
                }
            }

            Spacer() // Отделяет кнопку от списка и поля ввода

            // Поле ввода имени и кнопка
            HStack {
                TextField("Введите имя", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(height: 40)
                
                Button(action: {
                    if !name.isEmpty {
                        if let index = editingIndex, index < names.count {
                            names[index] = name
                            message = "Сохранено: \(name)"
                            editingIndex = nil
                        } else {
                            names.append(name)
                            message = "Добавлено: \(name)"
                        }
                        name = ""
                    }
                }) {
                    Text(editingIndex == nil ? "Добавить" : "Сохранить")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 100, height: 40)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16) // Отступ снизу для кнопки
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
