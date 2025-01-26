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
                         .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Image(systemName: "questionmark.diamond")
                        .imageScale(.large)
                } else {
                    ProgressView()
                }
            }
        }
        .frame(width: 200, height: 300)
        .cornerRadius(4)
    }
}

#Preview {
    let mockPosterPath = MockedMovieData().mock.posterURL
    MovieCardPosterView(moviePosterPath: mockPosterPath)
}
