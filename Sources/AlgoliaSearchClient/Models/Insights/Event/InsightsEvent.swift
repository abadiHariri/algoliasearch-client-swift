//
//  InsightsEvent.swift
//
//
//  Created by Vladislav Fitc on 23/04/2020.
//

import Foundation


public struct ObjectDataEvent: Codable {
    public init(queryID: QueryID? = nil, price: String? = nil, discount: Double? = nil, quantity: Int? = nil) {
        self.queryID = queryID
        self.price = price ?? "0.0"
        self.discount = discount ?? .zero
        self.quantity = quantity ?? 1
    }
    
    let queryID:QueryID?
    let price:String?
    let discount:Double?
    let quantity:Int?
}

public struct InsightsEvent {

    public let type: EventType
    public let subType: EventSubType?
    public let name: EventName
    public let indexName: IndexName
    public let userToken: UserToken?
    public let timestamp: Int64?
    public let queryID: QueryID?
    public let resources: Resources
    public let objectData: [ObjectDataEvent]?
    public let value: String?
    public let currency: String?

  init(type: EventType,
       subType: EventSubType? = nil,
       name: EventName,
       indexName: IndexName,
       userToken: UserToken?,
       timestamp: Int64?,
       queryID: QueryID?,
       objectData: [ObjectDataEvent]? = nil,
       value:String? = nil,
       currency: String? = nil,
       resources: Resources) throws {

    try ConstructionError.checkEventName(name)
    try ConstructionError.check(resources)

      self.type = type
      self.subType = subType
      self.name = name
      self.indexName = indexName
      self.userToken = userToken
      self.timestamp = timestamp
      self.queryID = queryID
      self.resources = resources
      self.objectData = objectData
      self.value = value
      self.currency = currency
  }

  init(type: EventType,
       subType: EventSubType? = nil,
       name: EventName,
       indexName: IndexName,
       userToken: UserToken?,
       timestamp: Date?,
       queryID: QueryID?,
       objectData: [ObjectDataEvent]? = nil,
       value:String? = nil,
       currency: String? = nil,
       resources: Resources) throws {
    let rawTimestamp = timestamp?.timeIntervalSince1970.milliseconds
    try self.init(type: type,
                  subType:subType,
                  name: name,
                  indexName: indexName,
                  userToken: userToken,
                  timestamp: rawTimestamp,
                  queryID: queryID,
                  objectData: objectData,
                  value: value,
                  currency: currency,
                  resources: resources)
           
  }

}

extension InsightsEvent: Codable {

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type = "eventType"
        case name = "eventName"
        case subType = "eventSubtype"
        case indexName = "index"
        case userToken
        case timestamp
        case queryID
        case positions
        case objectData
        case value
        case currency
    }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.type = try container.decode(forKey: .type)
    self.subType = try container.decodeIfPresent(forKey: .subType)
    self.name = try container.decode(forKey: .name)
    self.indexName = try container.decode(forKey: .indexName)
    self.userToken = try container.decodeIfPresent(forKey: .userToken)
    self.timestamp = try container.decodeIfPresent(forKey: .timestamp)
    self.queryID = try container.decodeIfPresent(forKey: .queryID)
      self.currency = try container.decodeIfPresent(forKey: .currency)
      self.objectData = try container.decodeIfPresent(forKey: .objectData)
      self.value = try container.decodeIfPresent(forKey: .value)
    self.resources = try Resources(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(name, forKey: .name)
    try container.encode(indexName, forKey: .indexName)
    try container.encodeIfPresent(userToken, forKey: .userToken)
    try container.encodeIfPresent(timestamp, forKey: .timestamp)
    try container.encodeIfPresent(queryID, forKey: .queryID)
    try container.encodeIfPresent(subType, forKey: .subType)
      try container.encodeIfPresent(currency, forKey: .currency)
      try container.encodeIfPresent(objectData, forKey: .objectData)
      try container.encodeIfPresent(value, forKey: .value)
    try resources.encode(to: encoder)
  }

}


extension InsightsEvent: CustomStringConvertible {

  public var description: String {
    """
    \n{
      name: \"\(name)\",
      type: \(type),
      subType: \(subType?.description ?? "none"),
      indexName: \(indexName),
      userToken: \(userToken ?? "none"),
      timestamp: \(timestamp?.description ?? "none"),
      currency: \(currency ?? "none"),
      objectData: \(objectData ?? []),
      value: \(value ?? "none"),
      queryID: \(queryID ?? "none"),
      \(resources)
    }
    """
  }

}
