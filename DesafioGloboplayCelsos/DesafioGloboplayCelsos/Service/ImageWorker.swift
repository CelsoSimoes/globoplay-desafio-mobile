//
//  ImageWorker.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

class ImageWorker: ObservableObject {
    @Published var image: Image? = nil
    @Published var isLoading = false
    @Published var error: String? = nil
    
    private let posterBaseURL: String = "https://image.tmdb.org/t/p/w500"
    
    func loadImage(_ posterPath: String?) async {

        guard let posterPath = posterPath,
              let url = URL(string: posterBaseURL + posterPath)
        else {
            error = "URL inválida."
            return
        }
        
        isLoading = true
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let uiImage = UIImage(data: data) {
                self.image = Image(uiImage: uiImage)
            } else {
                error = "Falha ao carregar a imagem."
            }
        } catch {
            self.error = "Erro ao carregar a imagem: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
