//
//  KeyView.swift
//  MicroLayerBuilder
//
//  Created by Emilio Cramer on 2023-10-16.
//

import Foundation
import SwiftUI

struct KeyView: View {
    @Binding var keyMapping: String

    var body: some View {
        Button(action: {
            // TODO: Implement action to change the keyMapping
        }) {
            Text(keyMapping)
                .frame(width: 75, height: 75)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
}
