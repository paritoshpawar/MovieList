//
//  MovieDetailsViewModel.swift
//  MovieList
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

@MainActor
final class MovieDetailsViewModel : ObservableObject {
    
    @Published var movieDetailsModel : MovieDetailsModel?
    @Published var errorMessage: String = ""
    @Published var errorOccured: Bool = false
    
    // MARK: Get Movie Details Service
    private let getMovieDetailsServiceObject: FetchMovieDetailsServiceProtocol
    
    init(movieDetailsModel: MovieDetailsModel? = nil, getMovieDetailsServiceObject: FetchMovieDetailsServiceProtocol) {
        self.movieDetailsModel = movieDetailsModel
        self.getMovieDetailsServiceObject = getMovieDetailsServiceObject
    }
    
    func getMovieDetais(movieID: String) async {
        let result = await getMovieDetailsServiceObject.getMoviesDetails(movieID: movieID)
        
        switch result {
        case .success(let model):
            movieDetailsModel = model
            
        case .failure(let error):
            errorOccured = true
            errorMessage = error.localizedDescription
        }
    }
}
