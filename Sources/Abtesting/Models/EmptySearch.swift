// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

/// Configuration for handling empty searches.
public struct EmptySearch: Codable, JSONEncodable {
    /// Whether to exclude empty searches when calculating A/B test results.
    public var exclude: Bool?

    public init(exclude: Bool? = nil) {
        self.exclude = exclude
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case exclude
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.exclude, forKey: .exclude)
    }
}

extension EmptySearch: Equatable {
    public static func ==(lhs: EmptySearch, rhs: EmptySearch) -> Bool {
        lhs.exclude == rhs.exclude
    }
}

extension EmptySearch: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.exclude?.hashValue)
    }
}