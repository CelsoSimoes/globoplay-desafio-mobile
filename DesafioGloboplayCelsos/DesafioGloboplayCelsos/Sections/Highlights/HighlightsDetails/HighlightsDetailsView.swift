//
//  HighlightsDetailsView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct HighlightsDetailsView: View {
    @StateObject private var viewModel: HighlightsDetailsViewModel

    init(movieDetailsData: MovieDetailsData) {
        _viewModel = StateObject(wrappedValue: HighlightsDetailsViewModel(movieDetailsData: movieDetailsData))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Ficha Técnica: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    DetailsTextCell(title: "Título original", text: viewModel.movieDetailsData.originalTitle)
                    DetailsTextCell(title: "Gêneros", text: viewModel.getGenres(genres: viewModel.movieDetailsData.genres))
                    DetailsTextCell(title: "Data de lançamento", text: viewModel.movieDetailsData.releaseDate)
                    DetailsTextCell(title: "Estúdios", text: viewModel.getStudios(studios: viewModel.movieDetailsData.productionCompanies))
                    DetailsTextCell(title: "Elenco", text: viewModel.movieDetailsData.originalTitle)
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 30)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        
    }
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsDetailsView(movieDetailsData: mockedData)
}
