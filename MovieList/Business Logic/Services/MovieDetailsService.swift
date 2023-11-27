//
//  MovieDetailsService.swift
//  MovieList
//
//  Created by Paritosh on 27/11/23.
//

import Foundation

protocol FetchMovieDetailsServiceProtocol {
    func getMoviesDetails(movieID: String) async -> Result<MovieDetailsModel?, NetworkError>
}

struct MovieDetailsService {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension MovieDetailsService : FetchMovieDetailsServiceProtocol {
    
    func getMoviesDetails(movieID: String) async -> Result<MovieDetailsModel?, NetworkError> {
        let requestData = GetMovieDetailsRequest.getMovieDetailsWith(movieID: movieID)
        do {
            return .success(try await requestManager.fetchData(urlRequest: requestData.createURLRequest()))
        }catch {
            return .failure(error as? NetworkError ?? NetworkError.invalidServerResponse)
        }

    }
    
    
}
