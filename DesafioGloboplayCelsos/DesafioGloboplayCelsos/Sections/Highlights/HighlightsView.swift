//
//  HighlightsView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct HighlightsView: View {
    var movieDetailsData: MovieDetailsData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                
                VStack(alignment: .center, spacing: 12) {
                    Rectangle()
                        .padding()
                    ZStack(alignment: .bottom) {
                        
                        MovieCardLandscapeView(movieLandscapeURL: movieDetailsData.backdropURL)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1.5),
                                                                   Color.black.opacity(0.0)]),
                                       startPoint: .bottom,
                                       endPoint: .top)
                            .frame(height: 50)
                    }
                    .frame(maxWidth: .infinity, minHeight: 200, alignment: .bottom)
                    
                    Text("\(movieDetailsData.title)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Filme")
                       .font(.headline)
                       .fontWeight(.regular)
                       .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
                    
                    Text("\(movieDetailsData.overview)")
                       .font(.headline)
                       .fontWeight(.regular)
                       .foregroundColor(Color.white.opacity(0.8))
                    
                    HStack(alignment: .center, spacing: 16) {
                        TrailerButton()
                            .cornerRadius(8)
                        
                        MyListButton()
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                HighlightsDetailsView(movieDetailsData: movieDetailsData)
                
            }
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .top)
        //.background(Color(red: 31/255, green: 31/255, blue: 31/255))
    }
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsView(movieDetailsData: mockedData)
}
