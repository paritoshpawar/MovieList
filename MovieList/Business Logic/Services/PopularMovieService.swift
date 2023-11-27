//
//  PopularMovieService.swift
//  MovieList
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

protocol FetchPopularMovieServiceProtocol {
    func getPopularMovies(language: String, page: String) async -> Result<PopularMoviesModel?, NetworkError>
}

struct PopularMovieService {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension PopularMovieService: FetchPopularMovieServiceProtocol {
    
    func getPopularMovies(language: String, page: String) async -> Result<PopularMoviesModel?, NetworkError> {
        let requestData = GetPopularMoviesRequest.getPopularMoviesWith(language: language, page: page)
        
        do {
            return .success(try await requestManager.fetchData(urlRequest: requestData.createURLRequest()))
        }catch {
            return .failure(error as? NetworkError ?? NetworkError.invalidServerResponse)
        }
    }
}
