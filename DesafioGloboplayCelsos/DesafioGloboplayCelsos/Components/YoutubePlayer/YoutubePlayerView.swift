//
//  YoutubePlayerView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

struct YoutubePlayerView: View {
    var movieTrailerKey: String
    
    var body: some View {
        ZStack {
            YouTubePlayerWorker(videoID: movieTrailerKey)
                        .frame(height: 170)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.black)
    }
}

#Preview {
    let mockMovieTrailerKey = "TXPkr5HcvBs"
    YoutubePlayerView(movieTrailerKey: mockMovieTrailerKey)
}
