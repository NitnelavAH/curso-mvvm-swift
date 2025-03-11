//
//  ToDoExtensions.swift
//  CursoMVVMSwift
//
//  Created by Gustavo Lizárraga on 9/12/24.
//

import SwiftUI

extension View {
    public func cornerRadius(
        _ radius: CGFloat,
        corners: UIRectCorner) -> some View {
        clipShape(
            ToDoRoundedCorner(
                radius: radius,
                corners: corners
            ))
    }
    
    public func transparentScrolling() -> some View {
        return onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

#Preview {
    VStack {
        Text("Hola Mundo")
            .padding()
        .background(Color.blue)
        
        .cornerRadius(16, corners: .bottomLeft)
        .foregroundStyle(.white)
    }
    
}
