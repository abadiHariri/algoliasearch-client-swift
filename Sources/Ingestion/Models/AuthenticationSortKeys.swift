// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Core
import Foundation

#if canImport(AnyCodable)
  import AnyCodable
#endif

/// Used to sort the Authentication list endpoint.
public enum AuthenticationSortKeys: String, Codable, CaseIterable {
  case name = "name"
  case authType = "auth_type"
  case platform = "platform"
  case updatedAt = "updatedAt"
  case createdAt = "createdAt"
}