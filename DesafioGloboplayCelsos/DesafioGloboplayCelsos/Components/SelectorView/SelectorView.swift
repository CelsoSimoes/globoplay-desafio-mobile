//
//  SelectorView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

struct SelectionView: View {
    @Binding var isDetails: Bool
    @State private var selectedOption: String = "Relacionados"

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {

                Button(action: {
                    selectedOption = "Relacionados"
                    isDetails = false
                }) {
                    Text("Relacionados")
                        .foregroundColor(selectedOption == "Relacionados" ? .white : Color.gray)
                        .padding()
                        .bold()
                }
                
                Button(action: {
                    selectedOption = "Detalhes"
                    isDetails = true
                }) {
                    Text("Detalhes")
                        .foregroundColor(selectedOption == "Detalhes" ? .white : Color.gray)
                        .padding()
                        .bold()
                }
            }
            .background(Color.black)

            Rectangle()
                .fill(Color.white)
                .frame(width: selectedOption == "Relacionados" ? 100 : 65,
                       height: 3)
                .offset(x: selectedOption == "Relacionados" ? -55 : 75)
                .animation(.easeInOut, value: selectedOption)
        }
    }
}

#Preview {
    SelectionView(isDetails: .constant(false))
}
