//
//  GetPopularMoviesRequest.swift
//  MovieList
//
//  Created by Mindstix on 26/11/23.
//

import Foundation

enum GetPopularMoviesRequest : RequestProtocol {
    
    case getPopularMoviesWith( language: String, page: String)
    
    var base: String { APIURLConstants.baseURL}
    
    var path: String { APIURLConstants.popularMoviePathURL}
    
    var urlParams: [String : String?] {
        switch self {
        case let .getPopularMoviesWith(language, page) :
            var params: [String: String] = [:]

            if !language.isEmpty { params[APIURLConstants.languageKey] = language }
            if !language.isEmpty { params[APIURLConstants.pageKey] = page }
            return params
        }
    }
    
    var headers: [String: String] {[
        APIURLConstants.authorizationKey : APIURLConstants.authKey
    ]}
    
    var requestType: RequestType { .GET }
}
