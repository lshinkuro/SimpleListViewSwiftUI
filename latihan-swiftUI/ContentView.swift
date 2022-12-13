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
                    Section {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    } header: {
                        HStack(spacing: 10) {
                            Image(section.name)
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(.gray, lineWidth: 2))
                            
                            Text(section.name)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.black)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(
                                    color: Color.gray.opacity(0.4),
                                    radius: 3, x: 0, y: 0)
                        )
                            
                     
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
