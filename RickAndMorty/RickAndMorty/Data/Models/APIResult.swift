//
//  APIResult.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//


struct APIResult<Response: Decodable>: Decodable {
    var info: Info
    var results: Response
}
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}
