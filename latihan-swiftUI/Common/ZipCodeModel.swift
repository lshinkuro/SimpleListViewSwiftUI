//
//  ZipCodeModel.swift
//  latihan-swiftUI
//
//  Created by nur kholis on 30/06/22.
//

import SwiftUI


class ZipCodeModel: ObservableObject {
    var limit: Int = 5

    @Published var zip: String = "" {
        didSet {
            if zip.count > limit {
                zip = String(zip.prefix(limit))
            }
        }
    }
}
