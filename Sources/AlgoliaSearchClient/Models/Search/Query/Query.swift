//
//  Query.swift
//
//
//  Created by Vladislav Fitc on 17.02.2020.
//

import Foundation

public indirect enum BaseQueryModel : Equatable {
   case base(Query)
    
    public func getQuery() -> Query {
        switch self {
        case .base(let query):
            return query
        }
    }
}

public struct Query: Equatable, SearchParameters {

  internal var searchParametersStorage: SearchParametersStorage

  /// Custom parameters
  public var customParameters: [String: JSON]?
  public var baseQuery: BaseQueryModel?
  public var refinements: [Attribute: [String]] = [:]
  public var disjunctiveFacets: Set<Attribute> = []
  
    public var fetchSmartFacetsInfo: Bool{
      page == 0 && !disjunctiveFacets.isEmpty && (!refinements.values.isEmpty)
    }
    
    public init(_ query: String? = nil) {
    searchParametersStorage = .init()
    self.searchParametersStorage.query = query
  }

  static let empty = Query()

}

extension Query: Codable {

  public init(from decoder: Decoder) throws {
    self.searchParametersStorage = try .init(from: decoder)
    customParameters = try CustomParametersCoder.decode(from: decoder, excludingKeys: SearchParametersStorage.CodingKeys.self)
  }

  public func encode(to encoder: Encoder) throws {
    try searchParametersStorage.encode(to: encoder)
    if let customParameters = customParameters {
      try CustomParametersCoder.encode(customParameters, to: encoder)
    }
  }

}

extension Query: SearchParametersStorageContainer {

}

extension Query: Builder {}

extension Query: ExpressibleByStringInterpolation {

  public init(stringLiteral value: String) {
    self.init(value)
  }

}
