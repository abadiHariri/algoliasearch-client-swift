// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on
// https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Foundation
#if canImport(Core)
    import Core
#endif

public enum RecommendPromote: Codable, JSONEncodable, AbstractEncodable, Hashable {
    case recommendPromoteObjectID(RecommendPromoteObjectID)
    case recommendPromoteObjectIDs(RecommendPromoteObjectIDs)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .recommendPromoteObjectID(value):
            try container.encode(value)
        case let .recommendPromoteObjectIDs(value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(RecommendPromoteObjectID.self) {
            self = .recommendPromoteObjectID(value)
        } else if let value = try? container.decode(RecommendPromoteObjectIDs.self) {
            self = .recommendPromoteObjectIDs(value)
        } else {
            throw DecodingError.typeMismatch(
                Self.Type.self,
                .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of RecommendPromote")
            )
        }
    }

    public func GetActualInstance() -> Encodable {
        switch self {
        case let .recommendPromoteObjectID(value):
            value as RecommendPromoteObjectID
        case let .recommendPromoteObjectIDs(value):
            value as RecommendPromoteObjectIDs
        }
    }
}
