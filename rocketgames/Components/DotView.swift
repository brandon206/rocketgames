//
//  DotView.swift
//  rocketgames
//
//  Created by Brandon Park on 4/17/24.
//

import SwiftUI

struct DotView: View {
    let index: Int
    @Binding var currentPage: Int

    var body: some View {
        Circle().fill(checkCurrentPage())
            .frame(width: 8, height: 8)
    }
    
    func checkCurrentPage() -> Color {
        if index == currentPage {
            return .black
        } else {
            return .black.opacity(0.20)
        }
    }
}

#Preview {
    Group {
        DotView(index: 0, currentPage: .constant(0))
        DotView(index: 1, currentPage: .constant(0))
    }
}
