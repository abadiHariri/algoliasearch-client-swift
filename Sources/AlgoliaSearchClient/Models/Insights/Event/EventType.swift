//
//  EventType.swift
//  
//
//  Created by Vladislav Fitc on 23/04/2020.
//

import Foundation

extension InsightsEvent {

  public struct EventType: StringOption, ProvidingCustomOption, CustomStringConvertible {

    public static var click: Self { .init(rawValue: #function) }
    public static var view: Self { .init(rawValue: #function) }
    public static var conversion: Self { .init(rawValue: #function) }

    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public var description: String {
      rawValue
    }

  }

}

extension InsightsEvent {

  public struct EventSubType: StringOption, ProvidingCustomOption, CustomStringConvertible {

    public static var addToCart: Self { .init(rawValue: #function) }
    public static var purchase: Self { .init(rawValue: #function) }

    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public var description: String {
      rawValue
    }

  }

}
