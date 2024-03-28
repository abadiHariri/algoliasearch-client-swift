// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

public struct SourceJSON: Codable, JSONEncodable {
    /// URL of the file.
    public var url: String
    /// Name of a column that contains a unique ID which will be used as `objectID` in Algolia.
    public var uniqueIDColumn: String?
    public var method: MethodType?

    public init(url: String, uniqueIDColumn: String? = nil, method: MethodType? = nil) {
        self.url = url
        self.uniqueIDColumn = uniqueIDColumn
        self.method = method
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case uniqueIDColumn
        case method
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.uniqueIDColumn, forKey: .uniqueIDColumn)
        try container.encodeIfPresent(self.method, forKey: .method)
    }
}
