//
//  MoviePosterBackground.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MoviePosterBackground: View {
    
    let moviePosterbackground: URL?
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: moviePosterbackground) { phase in
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
    }
}

#Preview {
    let moviePosterbackground = MockedMovieData().mock.posterURL
    MoviePosterBackground(moviePosterbackground: moviePosterbackground)
}
