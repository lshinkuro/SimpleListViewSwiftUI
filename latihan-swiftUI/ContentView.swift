//
//  ContentView.swift
//  latihan-swiftUI
//
//  Created by nur kholis on 30/06/22.
//

import SwiftUI

struct ContentView: View {
    
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)
                        .font(.caption)
                        .fontWeight(.black)){
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                        }
                }
            }.navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
