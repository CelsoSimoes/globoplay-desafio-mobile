//
//  MovieCardLandscapeView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MovieCardLandscapeView: View {
    let movieLandscapeURL: URL?
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: movieLandscapeURL) { phase in
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
    let mockLandscapeURL = MockedMovieData().mock.backdropURL
    MovieCardLandscapeView(movieLandscapeURL: mockLandscapeURL)
}
