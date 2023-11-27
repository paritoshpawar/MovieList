//
//  MovieDetailsView.swift
//  MovieList
//
//  Created by Paritosh on 26/11/23.
//

import SwiftUI

struct MovieDetailsView: View {
    var movieID : String?
    @StateObject var movieDetailsVM = MovieDetailsViewModel(getMovieDetailsServiceObject: MovieDetailsService(requestManager: NetworkManagerService()))
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(movieDetailsVM.movieDetailsModel?.originalTitle ?? "")
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(movieDetailsVM.movieDetailsModel?.overview ?? "")
                        .font(.headline)
                        .padding(.bottom)
                    
                    AsyncImage(url: URL(string: getImageURL(movieDetailsVM.movieDetailsModel?.posterPath ?? ""))) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 40, height: 40)
                    }
                    HStack {
                        Text("Production Companies:")
                        Text(movieDetailsVM.movieDetailsModel?.productionCompanies[0].name ?? "")
                    }
                    
                    
                    HStack() {
                        Text("Release date:")
                        Text(movieDetailsVM.movieDetailsModel?.releaseDate ?? "")
                    }
                    
                    HStack {
                        Text("Ratings:")
                        Text(String(movieDetailsVM.movieDetailsModel?.voteAverage ?? 0.0))
                    }
                }
            }
            .task {
                await movieDetailsVM.getMovieDetais(movieID: movieID ?? "")
            }
            .navigationTitle("Movie Details")
            .padding(.all
            )
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieID: "670292")
    }
}
