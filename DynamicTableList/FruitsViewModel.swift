//
//  FruitsViewModel.swift
//  DynamicTableList
//
//  Created by Val Po on 10.05.2023.
//

import Foundation

class FruitsViewModel: ObservableObject {
    @Published var fruits: [Fruit] = [
        Fruit(title: "Apple"),
        Fruit(title: "Pineapple"),
        Fruit(title: "Lemon"),
        Fruit(title: "Pear"),
        Fruit(title: "Mango")
    ]
}
