//
//  GetMovieDetailsRequest.swift
//  MovieList
//
//  Created by Paritosh on 27/11/23.
//


import Foundation

enum GetMovieDetailsRequest : RequestProtocol {
    
    case getMovieDetailsWith(movieID: String)
    
    var base: String { APIURLConstants.baseURL}
    
    var path: String {
        switch self {
        case let .getMovieDetailsWith(movieID) :
            return getMovieDetailsURL(movieID)
        }
    }
    
    var headers: [String: String] {[
        APIURLConstants.authorizationKey : APIURLConstants.authKey
    ]}
    
    var requestType: RequestType { .GET }
}
