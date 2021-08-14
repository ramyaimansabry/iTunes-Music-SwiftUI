//
//  MusicListViewModel.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 26/07/2021.
//

import Foundation


class MusicListViewModel: ObservableObject {
    
    @Published private(set) var items = [Music]()
    @Published var alertItem: AlertItem?
    
    init() { }
    
    func fetchMusicFeed() {
        let networkManager = NetworkManager()
        guard let url: URL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json") else { return }
        _ = networkManager.request(url: url, httpMethod: .get, parameters: nil, headers: nil) { [weak self] (result: APIResult<RSSResult>) in
            
            guard let self = self else { return }
            self.handleFetchingMusicFeedResult(result: result)
        }
    }
    
    private func handleFetchingMusicFeedResult(result: APIResult<RSSResult>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let data):
                self.items = data.feed.results
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
