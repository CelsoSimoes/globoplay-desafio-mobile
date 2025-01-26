//
//  MyListButton.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MyListButton: View {
    var body: some View {
        ZStack {

            Color.black
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white.opacity(0.85), lineWidth: 1)
            
            HStack(alignment: .center, spacing: 12){
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white.opacity(0.85))
                    .frame(width: 20, height: 20)
                Text("Minha Lista")
                    .foregroundColor(.white.opacity(0.85))
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    MyListButton()
}
