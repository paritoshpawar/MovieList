//
//  MovieListView.swift
//  MovieList
//
//  Created by Paritosh on 25/11/23.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var movieListVM = MovieListViewModel(getMovieServiceObject: PopularMovieService(requestManager: NetworkManagerService()))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(movieListVM.popularMovies?.results ?? []) { item in
                    NavigationLink(destination: MovieDetailsView(MovieID: "\(item.id)")) {
                        AsyncImage(url: URL(string: getImageURL(item.posterPath))) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .cornerRadius(20)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
                .padding(.all)
            }
            .navigationTitle(UIConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.automatic)
        }
        .task {
            await movieListVM.getPopularMovies()
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
