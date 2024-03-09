//
//  MiddlewareManager.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//
import Foundation

protocol MiddlewareManageable {
    func asyncRequest<Entity: Decodable>(with request: APIRequestConvertible) async throws -> Entity?
}


class MiddlewareManager: MiddlewareManageable {
    func asyncRequest<Entity>(with request: APIRequestConvertible) async throws -> Entity? where Entity : Decodable {
        do {
            let urlRequest = try request.asURLrequest()
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decodedResponse = try JSONDecoder().decode(APIResult<Entity>.self, from: data)
            return decodedResponse.results
        }
        
        catch {
            throw APIError.decoding
        }
    }
}
