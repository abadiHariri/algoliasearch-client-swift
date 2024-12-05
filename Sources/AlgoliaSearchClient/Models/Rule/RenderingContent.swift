//
//  RenderingContent.swift
//
//
//  Created by Vladislav Fitc on 11/03/2021.
//

import Foundation

/**
  * Content defining how the search interface should be rendered.
  * This is set via the settings for a default value and can be overridden via rules
  */
public struct RenderingContent: Codable {

  /// Defining how facets should be ordered
  public let facetOrdering: FacetOrdering?
  public let widgets: AlgoliaWidgets?
   
    
    enum CodingKeys: String, CodingKey {
        case facetOrdering
        case widgets
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.facetOrdering = (try? container.decodeIfPresent(FacetOrdering.self, forKey: .facetOrdering)) ?? nil
        self.widgets = (try? container.decodeIfPresent(AlgoliaWidgets.self, forKey: .widgets)) ?? nil
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(facetOrdering, forKey: .facetOrdering)
        try? container.encodeIfPresent(widgets, forKey: .widgets)
    }
}

public struct AlgoliaWidgets: Codable {
    public let banners: [Banner]
}

public struct Banner: Codable {
    public let image: Image?
    public let link: Link?
    
    public struct Image: Codable {
        public let urls: [URLInfo]?
        public let title: String?
    }

    public struct URLInfo: Codable {
        public let url: String?
    }

    public struct Link: Codable {
        public let url: String?
        public let target: String?
    }
}


