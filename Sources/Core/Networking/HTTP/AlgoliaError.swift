//
//  HTTPTransport+Error.swift
//
//
//  Created by Algolia on 02/03/2020.
//

import Foundation

public enum AlgoliaError: Error, LocalizedError {

  case requestError(Error)
  case httpError(HTTPError)
  case noReachableHosts(intermediateErrors: [Error])
  case missingData
  case decodingFailure(Error)

  public var errorDescription: String? {
    switch self {
    case .requestError(let error):
      return "Request failed: \(error.localizedDescription)"
    case .httpError(let error):
      return "HTTP error: \(error)"
    case .noReachableHosts(let errors):
      return
        "All hosts are unreachable. Intermediate errors: \(errors.map { $0.localizedDescription }.joined(separator: ", "))"
    case .missingData:
      return "Missing response data"
    case .decodingFailure:
      return "Response decoding failed"
    }
  }
}