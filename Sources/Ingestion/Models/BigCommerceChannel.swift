// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

public struct BigCommerceChannel: Codable, JSONEncodable {
    /// ID of the BigCommerce channel.
    public var id: Int
    /// Currencies for the given channel.
    public var currencies: [String]?

    public init(id: Int, currencies: [String]? = nil) {
        self.id = id
        self.currencies = currencies
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case currencies
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.currencies, forKey: .currencies)
    }
}
