// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Core
import Foundation

#if canImport(AnyCodable)
  import AnyCodable
#endif

public struct SearchForFacetsOptions: Codable, JSONEncodable, Hashable {

  static let maxFacetHitsRule = NumericRule<Int>(
    minimum: nil, exclusiveMinimum: false, maximum: 100, exclusiveMaximum: false, multipleOf: nil)
  /** Facet name. */
  public var facet: String
  /** Algolia index name. */
  public var indexName: String
  /** Text to search inside the facet's values. */
  public var facetQuery: String?
  /** Maximum number of facet hits to return when [searching for facet values](https://www.algolia.com/doc/guides/managing-results/refine-results/faceting/#search-for-facet-values). */
  public var maxFacetHits: Int?
  public var type: SearchTypeFacet

  public init(
    facet: String, indexName: String, facetQuery: String? = nil, maxFacetHits: Int? = nil,
    type: SearchTypeFacet
  ) {
    self.facet = facet
    self.indexName = indexName
    self.facetQuery = facetQuery
    self.maxFacetHits = maxFacetHits
    self.type = type
  }

  public enum CodingKeys: String, CodingKey, CaseIterable {
    case facet
    case indexName
    case facetQuery
    case maxFacetHits
    case type
  }

  // Encodable protocol methods

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(facet, forKey: .facet)
    try container.encode(indexName, forKey: .indexName)
    try container.encodeIfPresent(facetQuery, forKey: .facetQuery)
    try container.encodeIfPresent(maxFacetHits, forKey: .maxFacetHits)
    try container.encode(type, forKey: .type)
  }
}