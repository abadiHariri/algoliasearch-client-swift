//
//  Explain.swift
//  
//
//  Created by Vladislav Fitc on 23/03/2020.
//

import Foundation

public struct Explain: Codable {
    public let params: QueryParams?
    
    public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.params = (try? container?.decodeIfPresent(QueryParams.self, forKey: .params)) ?? nil
    }
}

public struct QueryParams: Codable {
    public let client: QueryParamsInfo?
    public let final: QueryParamsInfo?
    public let rules: QueryParamsInfo?
    
    public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.final = (try? container?.decodeIfPresent(QueryParamsInfo.self, forKey: .final)) ?? nil
        self.rules = (try? container?.decodeIfPresent(QueryParamsInfo.self, forKey: .rules)) ?? nil
        self.client = (try? container?.decodeIfPresent(QueryParamsInfo.self, forKey: .client)) ?? nil
    }
}

public struct QueryParamsInfo: Codable {
   
    public let analyticsTags: [String]?
    public let facetFilters: [String]?
    public let numericFilters: [String]?
    public let optionalFilters: [String]?
    public let ruleContexts: [String]?
    
    public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.analyticsTags = (try? container?.decodeIfPresent([String].self, forKey: .analyticsTags)) ?? nil
        self.facetFilters = (try? container?.decodeIfPresent([String].self, forKey: .facetFilters)) ?? nil
        self.numericFilters = (try? container?.decodeIfPresent([String].self, forKey: .numericFilters)) ?? nil
        
        self.optionalFilters = (try? container?.decodeIfPresent([String].self, forKey: .optionalFilters)) ?? nil
        self.ruleContexts = (try? container?.decodeIfPresent([String].self, forKey: .ruleContexts)) ?? nil
    }
}
