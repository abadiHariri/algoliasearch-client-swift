// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

public struct AbTestsVariant: Codable, JSONEncodable, Hashable {
    /// A/B test index.
    public var index: String
    /// A/B test traffic percentage.
    public var trafficPercentage: Int
    /// A/B test description.
    public var description: String?

    public init(index: String, trafficPercentage: Int, description: String? = nil) {
        self.index = index
        self.trafficPercentage = trafficPercentage
        self.description = description
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case index
        case trafficPercentage
        case description
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.index, forKey: .index)
        try container.encode(self.trafficPercentage, forKey: .trafficPercentage)
        try container.encodeIfPresent(self.description, forKey: .description)
    }
}
