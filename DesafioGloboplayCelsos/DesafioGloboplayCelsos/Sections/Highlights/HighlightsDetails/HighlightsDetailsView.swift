//
//  HighlightsDetailsView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct HighlightsDetailsView: View {
    var movieDetailsData: MovieDetailsData
    var body: some View {
        ScrollView(.vertical, showsIndicators: false)
        {
            ZStack {
                Text("CelsosPlay")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(20)
            .frame(maxWidth: .infinity, minHeight: 120, alignment: .bottom)
            .background(Color.black)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Ficha Técnica: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    DetailsTextCell(title: "Título original", text: movieDetailsData.originalTitle)
                    DetailsTextCell(title: "Gêneros", text: movieDetailsData.genres.first?.name ?? "")
                    DetailsTextCell(title: "Data de lançamento", text: movieDetailsData.releaseDate)
                    DetailsTextCell(title: "Estúdios", text: movieDetailsData.productionCompanies.first?.name ?? "")
                    DetailsTextCell(title: "Elenco", text: movieDetailsData.originalTitle)
                    DetailsTextCell(title: "CelsosPlay", text: movieDetailsData.originalTitle)
                    Text("CelsosPlay: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 138/255, green: 138/255, blue: 138/255))
                     + Text("""
                         Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
                         Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
                         """)
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
                    
                    Text("Data: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 138/255, green: 138/255, blue: 138/255))
                     + Text("17/08/2024")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
                }
                
            }
            .padding(.horizontal)
            .onAppear {
                
            }
        }
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsDetailsView(movieDetailsData: mockedData)
}
