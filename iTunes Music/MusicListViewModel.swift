//
//  MusicListViewModel.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 26/07/2021.
//

import Foundation


class MusicListViewModel: ObservableObject {
    
    private var networkManager = NetworkManager()
    @Published var items = [Music]()
    @Published var alertItem: AlertItem?
    
    init() {
        
    }
    
    func fetchMusicFeed() {
        guard let url: URL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json") else { return }
        _ = networkManager.request(url: url, httpMethod: .get, parameters: nil, headers: nil) { (result: APIResult<RSSResult>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.items = data.feed.results
                }
                break
            case .failure(let error):
                self.alertItem = AlertItem(title: "Error", message: error?.localizedDescription ?? "UnExpected Error", buttonTitle: "OK")
                break
            case .decodingFailure(let error):
                self.alertItem = AlertItem(title: "Error", message: error?.localizedDescription ?? "UnExpected Error", buttonTitle: "OK")
                break
            case .badRequest(let error):
                self.alertItem = AlertItem(title: "Error", message: error?.localizedDescription ?? "UnExpected Error", buttonTitle: "OK")
                break
            }
        }
    }
}
