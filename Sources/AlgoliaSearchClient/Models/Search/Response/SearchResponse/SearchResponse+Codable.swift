//
//  SearchResponse+Codable.swift
//
//
//  Created by Vladislav Fitc on 19/03/2020.
//

import Foundation

extension SearchResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case hits
        case nbHits
        case page
        case hitsPerPage
        case offset
        case length
        case userData
        case nbPages
        case processingTimeMS
        case exhaustiveNbHits
        case exhaustiveFacetsCount
        case query
        case queryAfterRemoval
        case params
        case message
        case aroundLatLng
        case automaticRadius
        case serverUsed
        case indexUsed
        case abTestID
        case abTestVariantID
        case parsedQuery
        case facetsStorage = "facets"
        case disjunctiveFacetsStorage = "disjunctiveFacets"
        case facetStatsStorage = "facets_stats"
        case cursor
        case indexName = "index"
        case processed
        case queryID
        case hierarchicalFacetsStorage = "hierarchicalFacets"
        case explain
        case appliedRules
        case renderingContent
        case appliedRelevancyStrictness
        case nbSortedHits
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hits = try container.decode(forKey: .hits)
        self.nbHits = try? container.decodeIfPresent(forKey: .nbHits) ?? nil
        self.page = try? container.decodeIfPresent(forKey: .page) ?? nil
        self.hitsPerPage = try? container.decodeIfPresent(forKey: .hitsPerPage) ?? nil
        self.offset = try? container.decodeIfPresent(forKey: .offset) ?? nil
        self.length = try? container.decodeIfPresent(forKey: .length) ?? nil
        self.userData = try? container.decodeIfPresent(forKey: .userData) ?? nil
        self.nbPages = try? container.decodeIfPresent(forKey: .nbPages) ?? nil
        self.processingTimeMS = try? container.decodeIfPresent(forKey: .processingTimeMS) ?? nil
        self.exhaustiveNbHits = try? container.decodeIfPresent(forKey: .exhaustiveNbHits) ?? nil
        self.exhaustiveFacetsCount = try? container.decodeIfPresent(forKey: .exhaustiveFacetsCount) ?? nil
        self.query = try? container.decodeIfPresent(forKey: .query) ?? nil
        self.queryAfterRemoval = try? container.decodeIfPresent(forKey: .queryAfterRemoval) ?? nil
        self.params = try? container.decodeIfPresent(forKey: .params) ?? nil
        self.message = try? container.decodeIfPresent(forKey: .message) ?? nil
        self.aroundLatLng = try? container.decodeIfPresent(forKey: .aroundLatLng) ?? nil
        let legacyAutomaticRadius: String? = try? container.decodeIfPresent(forKey: .automaticRadius) ?? nil
        self.automaticRadius = legacyAutomaticRadius.flatMap(Double.init)
        self.serverUsed = try? container.decodeIfPresent(forKey: .serverUsed) ?? nil
        self.indexUsed = try? container.decodeIfPresent(forKey: .indexUsed) ?? nil
        self.abTestID = try? container.decodeIfPresent(forKey: .abTestID) ?? nil
        self.abTestVariantID = try? container.decodeIfPresent(forKey: .abTestVariantID) ?? nil
        self.parsedQuery = try? container.decodeIfPresent(forKey: .parsedQuery) ?? nil
        self.facetsStorage = try? container.decodeIfPresent(forKey: .facetsStorage) ?? nil
        self.disjunctiveFacetsStorage = try? container.decodeIfPresent(forKey: .disjunctiveFacetsStorage) ?? nil
        self.facetStatsStorage = try? container.decodeIfPresent(forKey: .facetStatsStorage) ?? nil
        self.cursor = try? container.decodeIfPresent(forKey: .cursor) ?? nil
        self.indexName = try? container.decodeIfPresent(forKey: .indexName) ?? nil
        self.processed = try? container.decodeIfPresent(forKey: .processed) ?? nil
        self.queryID = try? container.decodeIfPresent(forKey: .queryID) ?? nil
        self.hierarchicalFacetsStorage = try? container.decodeIfPresent(forKey: .hierarchicalFacetsStorage) ?? nil
        self.explain = try? container.decodeIfPresent(forKey: .explain) ?? nil
        self.appliedRules = try? container.decodeIfPresent(forKey: .appliedRules) ?? nil
        self.renderingContent = try? container.decodeIfPresent(forKey: .renderingContent) ?? nil
        self.appliedRelevancyStrictness = try? container.decodeIfPresent(forKey: .appliedRelevancyStrictness) ?? nil
        self.nbSortedHits = try? container.decodeIfPresent(forKey: .nbSortedHits) ?? nil
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hits, forKey: .hits)
        (try? container.encodeIfPresent(nbHits, forKey: .nbHits)) ?? nil
        (try? container.encodeIfPresent(page, forKey: .page)) ?? nil
        (try? container.encodeIfPresent(hitsPerPage, forKey: .hitsPerPage)) ?? nil
        (try? container.encodeIfPresent(offset, forKey: .offset)) ?? nil
        (try? container.encodeIfPresent(length, forKey: .length)) ?? nil
        (try? container.encodeIfPresent(userData, forKey: .userData)) ?? nil
        (try? container.encodeIfPresent(nbPages, forKey: .nbPages)) ?? nil
        (try? container.encodeIfPresent(processingTimeMS, forKey: .processingTimeMS)) ?? nil
        (try? container.encodeIfPresent(exhaustiveNbHits, forKey: .exhaustiveNbHits)) ?? nil
        (try? container.encodeIfPresent(exhaustiveFacetsCount, forKey: .exhaustiveFacetsCount)) ?? nil
        (try? container.encodeIfPresent(query, forKey: .query)) ?? nil
        (try? container.encodeIfPresent(queryAfterRemoval, forKey: .queryAfterRemoval)) ?? nil
        (try? container.encodeIfPresent(params, forKey: .params)) ?? nil
        (try? container.encodeIfPresent(message, forKey: .message)) ?? nil
        (try? container.encodeIfPresent(aroundLatLng, forKey: .aroundLatLng)) ?? nil
        let legacyAutomaticRadius = automaticRadius.flatMap { "\($0)" }
        (try? container.encodeIfPresent(legacyAutomaticRadius, forKey: .automaticRadius)) ?? nil
        (try? container.encodeIfPresent(serverUsed, forKey: .serverUsed)) ?? nil
        (try? container.encodeIfPresent(indexUsed, forKey: .indexUsed)) ?? nil
        (try? container.encodeIfPresent(abTestID, forKey: .abTestID)) ?? nil
        (try? container.encodeIfPresent(abTestVariantID, forKey: .abTestVariantID)) ?? nil
        (try? container.encodeIfPresent(parsedQuery, forKey: .parsedQuery)) ?? nil
        (try? container.encodeIfPresent(facetsStorage, forKey: .facetsStorage)) ?? nil
        (try? container.encodeIfPresent(disjunctiveFacetsStorage, forKey: .disjunctiveFacetsStorage)) ?? nil
        (try? container.encodeIfPresent(facetStatsStorage, forKey: .facetStatsStorage)) ?? nil
        (try? container.encodeIfPresent(cursor, forKey: .cursor)) ?? nil
        (try? container.encodeIfPresent(indexName, forKey: .indexName)) ?? nil
        (try? container.encodeIfPresent(processed, forKey: .processed)) ?? nil
        (try? container.encodeIfPresent(queryID, forKey: .queryID)) ?? nil
        (try? container.encodeIfPresent(hierarchicalFacetsStorage, forKey: .hierarchicalFacetsStorage)) ?? nil
        (try? container.encodeIfPresent(explain, forKey: .explain)) ?? nil
        (try? container.encodeIfPresent(appliedRules, forKey: .appliedRules)) ?? nil
        (try? container.encodeIfPresent(renderingContent, forKey: .renderingContent)) ?? nil
        (try? container.encodeIfPresent(appliedRelevancyStrictness, forKey: .appliedRelevancyStrictness)) ?? nil
        (try? container.encodeIfPresent(nbSortedHits, forKey: .nbSortedHits)) ?? nil
    }
    
}
