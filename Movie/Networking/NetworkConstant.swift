//
//  NetworkConstant.swift
//  Movie
//
//  Created by Ahmed on 26/04/2026.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //singletone
    }
    
    public var apiKey: String {
        get {
            return "64b1adec174bad183a638acdef39d1e4"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    // https://api.themoviedb.org/3/trending/all/day?api_key=64b1adec174bad183a638acdef39d1e4
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
