//
//  TrailerButton.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct TrailerButton: View {
    var body: some View {
        ZStack {

            Color.white
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)
            
            HStack(alignment: .center, spacing: 12){
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black.opacity(0.7))
                    .frame(width: 20, height: 20)
                Text("Trailer")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.title3)
                    .fontWeight(.heavy)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    TrailerButton()
}
