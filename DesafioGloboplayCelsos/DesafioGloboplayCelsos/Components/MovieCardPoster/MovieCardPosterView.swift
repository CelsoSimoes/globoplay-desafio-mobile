//
//  MovieCardPosterView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MovieCardPosterView: View {
    
    let moviePosterPath: URL?
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: moviePosterPath) { phase in
                if let image = phase.image {
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                } else if phase.error != nil {

                    VStack {
                        Image(systemName: "questionmark.diamond")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Ops! Imagem não encontrada")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                } else {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    let mockPosterPath = MockedMovieData().mock.posterURL
    MovieCardPosterView(moviePosterPath: mockPosterPath)
}
