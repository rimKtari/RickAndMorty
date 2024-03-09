//
//  APIError.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation
enum APIError: LocalizedError {
   case invalidPath
   case decoding
}

extension APIError {
   var errorDescription: String {
      switch self {
      case .invalidPath:
         return "Invalid Path"
      case .decoding:
         return "There was an error decoding the type"
      }
   }
}
