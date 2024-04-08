// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

public struct ReplaceSourceResponse: Codable, JSONEncodable {
    /// Date and time when the object was updated, in RFC 3339 format.
    public var updatedAt: String

    public init(updatedAt: String) {
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case updatedAt
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }
}

extension ReplaceSourceResponse: Equatable {
    public static func ==(lhs: ReplaceSourceResponse, rhs: ReplaceSourceResponse) -> Bool {
        lhs.updatedAt == rhs.updatedAt
    }
}

extension ReplaceSourceResponse: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.updatedAt.hashValue)
    }
}
