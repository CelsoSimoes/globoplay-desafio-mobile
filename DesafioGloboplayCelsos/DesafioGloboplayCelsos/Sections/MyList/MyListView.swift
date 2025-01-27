//
//  MyListView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MyListView: View {
    
    private let viewTitle: String = "Minha Lista"
    @State var favoriteMovies = UserDefaultsWorker().fetchMovies()
    
    private var columns: [GridItem] {
        [GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())]
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(viewTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: removeAllFavorites) {
                        Image(systemName: "trash.fill")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.black)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(self.favoriteMovies) { movieData in
                            NavigationLink(destination: HighlightsView(movieId: movieData.id)) {
                                MovieCardPosterView(moviePosterPath: movieData.posterURL)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(red: 31/255, green: 31/255, blue: 31/255))
            .onAppear {
                updateFavoriteMovies()
            }
            
        }
    }
    
    private func removeAllFavorites() {
        UserDefaultsWorker().clearAll()
    }
    
    private func updateFavoriteMovies() {
        favoriteMovies = UserDefaultsWorker().fetchMovies()
    }
    
    
}

#Preview {
    MyListView()
}
