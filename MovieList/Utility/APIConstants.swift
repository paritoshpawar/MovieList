//
//  APIConstants.swift
//  MovieList
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

struct APIURLConstants {
    static let URLScheme                       = "https"
    static let authorizationKey                = "Authorization"
    static let contentTypeKey                  = "accept"
    static let contentTypeValue                = "application/json"
    static let baseURL                         = "api.themoviedb.org"
    static let popularMoviePathURL             = "/3/movie/popular"
    static let languageKey                     = "language"
    static let pageKey                         = "page"
    static let imageDBURL                      = "https://image.tmdb.org/t/p/w1280"
    static let authKey                         = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZWFmYmQxODAyYzYyYzA3NDMxOGE2MWU3YWZhOGM3ZiIsInN1YiI6IjY1NjE4ODcyYjIzNGI5MDExYzg1ODcwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0ZN9aUUaiULMDX8iFOlKuYNJP-jzn4b5IkFaVM8p7gI"
}

struct NetworkErrorConstants {
    static let invalidServerResponse             = "Unexpected error occured"
    static let invalidURL                        = "URL string is malformed."
}

struct UIConstants {
    static let navigationTitle = "Popular Movies"
}


func getImageURL(_ posterLink : String) -> String {
    return "\(APIURLConstants.imageDBURL)\(posterLink)"
}
