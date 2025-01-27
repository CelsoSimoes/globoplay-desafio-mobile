//
//  MyListButton.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MyListButton: View {
    
    @Binding var isFavorited: Bool
    @State private var text = ""
    @State private var icon = ""
    
    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white.opacity(0.85), lineWidth: 1)
            
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white.opacity(0.85))
                    .frame(width: 20, height: 20)
                Text(text)
                    .foregroundColor(.white.opacity(0.85))
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(height: 60)
        .onAppear {
            updateButtonAppearance()
        }
        .onChange(of: isFavorited) { _, _ in
            updateButtonAppearance()
        }
    }
    
    private func updateButtonAppearance() {
        withAnimation(.easeOut) {
            if isFavorited {
                text = "Adicionado"
                icon = "checkmark"
            } else {
                text = "Minha Lista"
                icon = "star.fill"
            }
        }
    }
}

#Preview {
    MyListButton(isFavorited: .constant(true))
}
