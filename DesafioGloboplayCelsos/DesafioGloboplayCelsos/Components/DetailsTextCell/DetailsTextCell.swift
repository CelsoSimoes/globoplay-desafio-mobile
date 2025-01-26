//
//  DetailsTextCell.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct DetailsTextCell: View {
    var title: String
    var text: String
    
    var body: some View {
        Text("\(title): ")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 138/255, green: 138/255, blue: 138/255))
         + Text(text)
            .font(.headline)
            .fontWeight(.regular)
            .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
    }
}

#Preview {
    DetailsTextCell(title: "Celsos", text: "muito muitos testes")
}
