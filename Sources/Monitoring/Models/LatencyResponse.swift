// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Core
import Foundation

#if canImport(AnyCodable)
  import AnyCodable
#endif

public struct LatencyResponse: Codable, JSONEncodable, Hashable {

  public var metrics: LatencyResponseMetrics?

  public init(metrics: LatencyResponseMetrics? = nil) {
    self.metrics = metrics
  }

  public enum CodingKeys: String, CodingKey, CaseIterable {
    case metrics
  }

  // Encodable protocol methods

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(metrics, forKey: .metrics)
  }
}