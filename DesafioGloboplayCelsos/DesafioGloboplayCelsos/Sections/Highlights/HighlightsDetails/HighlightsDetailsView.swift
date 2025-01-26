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
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Ficha Técnica: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    DetailsTextCell(title: "Título original", text: movieDetailsData.originalTitle)
                    DetailsTextCell(title: "Gêneros", text: getGenres(genres: movieDetailsData.genres))
                    DetailsTextCell(title: "Data de lançamento", text: movieDetailsData.releaseDate)
                    DetailsTextCell(title: "Estúdios", text: getStudios(studios: movieDetailsData.productionCompanies))
                    DetailsTextCell(title: "Elenco", text: movieDetailsData.originalTitle)
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical, 30)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        
    }
    
    private func getGenres(genres: [Genre]) -> String {
        var allGenres = ""
        for genre in genres {
            allGenres += "\(genre.name), "
        }
        
        if allGenres != "" { allGenres.removeLast(2) }
        return allGenres
    }
    
    private func getStudios(studios: [ProductionCompany]) -> String {
        var allStudios = ""
        for studio in studios {
            allStudios += "\(studio.name), "
        }
        
        if allStudios != "" { allStudios.removeLast(2) }
        return allStudios
    }
    
    
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsDetailsView(movieDetailsData: mockedData)
}
