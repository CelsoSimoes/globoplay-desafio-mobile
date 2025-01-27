//
//  ErrorView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Algo deu errado...")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(message)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button(action: retryAction) {
                Text("Tentar novamente")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ErrorView(message: "Error Alert", retryAction: {})
}
