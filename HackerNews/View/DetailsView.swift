//
//  DetailsView.swift
//  HackerNews
//
//  Created by surajkumar on 05/10/25.
//

import SwiftUI
import WebKit
struct DetailsView: View {
    let url:String?
    var body: some View {
        webtype(urlString: url)
    }
}
#Preview {
    DetailsView(url: "https://www.google.com/search?client=safari&rls=en&q=miakhalifa&ie=UTF-8&oe=UTF-8")
}

struct webtype: UIViewRepresentable{
    var urlString: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safestring = urlString{
            if let urltemp = URL(string: safestring){
                let request = URLRequest(url: urltemp)
                uiView.load(request)
            }
            
        }
    }
}

