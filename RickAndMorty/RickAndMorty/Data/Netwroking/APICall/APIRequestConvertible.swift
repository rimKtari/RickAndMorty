//
//  APIRequestConvertible.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

struct AppConstants {
    static let baseURL = "https://rickandmortyapi.com/api/"
}
protocol APIRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem] { get }
    var httpBody: Data? { get }
}


extension APIRequestConvertible {
    var httpMethod: HTTPMethod { .get } // override
    var httpBody: Data? { nil }
    
    var baseURL: String {
        return  AppConstants.baseURL
    }
    
    var headers: [String: String]? {
        [:]
    }
}


public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

extension APIRequestConvertible {
    func asURLrequest() throws -> URLRequest  {
        guard var urlComponents = URLComponents(string: baseURL) else {
            // TODO: log error message
            throw APIError.invalidPath
        }
       
        urlComponents.path += path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw APIError.invalidPath
        }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody
        request.timeoutInterval = 30
        return request

    }
}
