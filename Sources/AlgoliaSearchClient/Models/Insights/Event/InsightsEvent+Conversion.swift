//
//  InsightsEvent+Conversion.swift
//  
//
//  Created by Vladislav Fitc on 23/04/2020.
//

import Foundation

public extension InsightsEvent {
 
  static func conversion(subType: EventSubType?=nil,
                         name: EventName,
                         indexName: IndexName,
                         userToken: UserToken?,
                         timestamp: Date? = nil,
                         queryID: QueryID?,
                         objectIDs: [ObjectID],
                         objectData: [ObjectDataEvent]? = nil,
                         currency: String? = nil) throws -> Self {
    return try self.init(type: .conversion,
                         subType: subType,
                         name: name,
                         indexName: indexName,
                         userToken: userToken,
                         timestamp: timestamp,
                         queryID: queryID,
                         objectData: objectData,
                         currency: currency,
                         resources: .objectIDs(objectIDs))
  }

  static func conversion(subType: EventSubType?=nil,
                         name: EventName,
                         indexName: IndexName,
                         userToken: UserToken?,
                         timestamp: Date? = nil,
                         queryID: QueryID?,
                         filters: [String]) throws -> Self {
    return try self.init(type: .conversion,
                         subType: subType,
                         name: name,
                         indexName: indexName,
                         userToken: userToken,
                         timestamp: timestamp,
                         queryID: queryID,
                         resources: .filters(filters))
  }

}
