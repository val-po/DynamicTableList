//
//  ContentView.swift
//  DynamicTableList
//
//  Created by Val Po on 10.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FruitsViewModel()
    @State var text = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Section(header: Text("Add new fruit")) {
                        TextField("Fruit name", text: $text)
                            .padding()
                        Button(action: {
                            self.addToList()
                        }, label: {
                            Text("Add to list")
                                .bold()
                                .frame(width: 250,
                                       height: 50,
                                       alignment: .center)
                                .background(Color.green)
                                .cornerRadius(8)
                                .foregroundColor(Color.white)
                        })
                    }
                    List {
                        ForEach(viewModel.fruits) { fruit in
                            FruitRow(title: fruit.title)
                        }
                    }
                    .navigationTitle("Fruits")
                }
            }
        }
        .padding()
    }
    func addToList() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let newFruit = Fruit(title: text)
        viewModel.fruits.append(newFruit)
        text = ""
    }
}

struct FruitRow: View {
    let title: String
    
    var body: some View {
        Label(
            title: { Text(title) },
            icon: { Image(systemName: "takeoutbag.and.cup.and.straw")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
