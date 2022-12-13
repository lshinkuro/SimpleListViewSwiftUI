//
//  itemDetail.swift
//  latihan-swiftUI
//
//  Created by nur kholis on 30/06/22.
//

import SwiftUI

struct itemDetail: View {
    
     @EnvironmentObject var order: Order
    
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaleEffect()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Text(item.description).padding()
            Button("Order This"){
                order.add(item: item)
            }.font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct itemDetail_Previews: PreviewProvider {
    static var previews: some View {
        itemDetail(item: MenuItem.example).environmentObject(Order())
    }
}
