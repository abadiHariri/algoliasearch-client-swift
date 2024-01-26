// Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

import Core
import Foundation

#if canImport(AnyCodable)
  import AnyCodable
#endif

/// An identifier that pairs with the outcome reason.
public enum RunReasonCode: String, Codable, CaseIterable {
  case `internal` = "internal"
  case critical = "critical"
  case noEvents = "no_events"
  case tooManyErrors = "too_many_errors"
  case ok = "ok"
  case discarded = "discarded"
  case blocking = "blocking"
}