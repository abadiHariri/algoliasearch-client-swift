//
//  InsightsEvent+Click.swift
//
//
//  Created by Vladislav Fitc on 23/04/2020.
//

import Foundation

public extension InsightsEvent {

  static func click(name: EventName,
                    indexName: IndexName,
                    userToken: UserToken?,
                    timestamp: Date? = nil,
                    queryID: QueryID,
                    objectData: [ObjectDataEvent]? = nil,
                    value: String? = nil,
                    currency: String? = nil,
                    objectIDsWithPositions: [(ObjectID, Int)]) throws -> Self {
    return try self.init(type: .click,
                         name: name,
                         indexName: indexName,
                         userToken: userToken,
                         timestamp: timestamp,
                         queryID: queryID,
                         objectData: objectData,
                         value: value,
                         currency: currency,
                         resources: .objectIDsWithPositions(objectIDsWithPositions))
  }

  static func click(name: EventName,
                    indexName: IndexName,
                    userToken: UserToken?,
                    timestamp: Date? = nil,
                    objectIDs: [ObjectID],
                    objectData: [ObjectDataEvent]? = nil,
                    value: String? = nil,
                    currency: String? = nil) throws -> Self {
    return try self.init(type: .click,
                         name: name,
                         indexName: indexName,
                         userToken: userToken,
                         timestamp: timestamp,
                         queryID: .none,
                         objectData: objectData,
                         value: value,
                         currency: currency,
                         resources: .objectIDs(objectIDs))
  }

  static func click(name: EventName,
                    indexName: IndexName,
                    userToken: UserToken?,
                    timestamp: Date? = nil,
                    filters: [String]) throws -> Self {
    return try self.init(type: .click,
                         name: name,
                         indexName: indexName,
                         userToken: userToken,
                         timestamp: timestamp,
                         queryID: .none,
                         resources: .filters(filters))
  }

}
