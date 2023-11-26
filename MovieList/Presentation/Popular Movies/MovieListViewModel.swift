//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Mindstix on 26/11/23.
//

import Foundation

@MainActor
final class MovieListViewModel : ObservableObject {
    
    @Published var movieList : [ResultModel] = []
    @Published var errorMessage: String = ""
    @Published var errorOccured: Bool = false
    
    @Published var popularMovies : PopularMoviesModel?
    
    // MARK: Get movie service
    private let getMovieServiceObject: FetchPopularMovieServiceProtocol
    
    init(getMovieServiceObject: FetchPopularMovieServiceProtocol) {
        self.getMovieServiceObject = getMovieServiceObject
    }
    
    func getPopularMovies() async {
        let result = await getMovieServiceObject.getPopularMovies(language: "en-US", page: "1")
        
        switch result {
        case .success(let model):
            popularMovies = model
            
        case .failure(let error):
            errorOccured = true
            errorMessage = error.localizedDescription
        }
    }
}
