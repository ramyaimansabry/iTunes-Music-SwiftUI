//
//  ContentView.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 20/07/2021.
//

import SwiftUI
import Kingfisher


struct MusicListView: View {
    
    @ObservedObject private var viewModel = MusicListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top)
                ],spacing: 12, content: {
                    ForEach(viewModel.items, id: \.self) { musicObject in
                        MusicCell(musicObject: musicObject)
                    }
                })
                .padding(.horizontal, 12)
            }
            .navigationTitle("iTunes Music")
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle) )
            })
        }
        .onAppear(perform: {
            viewModel.fetchMusicFeed()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}

struct MusicCell: View {
    
    let musicObject: Music
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            KFImage(URL(string: musicObject.artworkUrl100))
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(musicObject.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 5)
            Text(musicObject.artistName)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}
