//
//  YouTubePlayerWorker.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI
import WebKit

struct YouTubePlayerWorker: UIViewControllerRepresentable {
    let videoID: String // mock: TXPkr5HcvBs

    func makeUIViewController(context: Context) -> UIViewController {
        let webView = WKWebView()
        let viewController = UIViewController()
        viewController.view = webView

        if let url = URL(string: "https://www.youtube.com/watch?v=\(videoID)") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
