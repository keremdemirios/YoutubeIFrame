//
//  NetworkConstant.swift
//  IKFramePlayer
//
//  Created by Kerem Demir on 3.11.2023.
//

import Foundation
import UIKit

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // singletone
    }
//https://api.themoviedb.org/3/trending/movie/day?language=en-US
    public var apiKey: String {
        get {
            // API KEY
            return "9d4e2bb4b5c9913f7dfecec00f852fc2"
        }
    }
    
    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAdress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
//            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
//https://api.themoviedb.org/3/trending/movie/day?api_key=9d4e2bb4b5c9913f7dfecec00f852fc2

