//
//  Index+Search.swift
//  
//
//  Created by Vladislav Fitc on 03/03/2020.
//

import Foundation

public extension Index {
  
  //MARK: - Search

  /**
   Method used for querying an index.
   
   - Note: The search query only allows for the retrieval of up to 1000 hits.
   If you need to retrieve more than 1000 hits (e.g. for SEO), you can either leverage
   the [Browse index](https://www.algolia.com/doc/api-reference/api-methods/browse/) method or increase
   the [paginationLimitedTo](https://www.algolia.com/doc/api-reference/api-parameters/paginationLimitedTo/) parameter.
   - Parameter query: The Query used to search.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Parameter completion: Result completion
   - Returns: Launched asynchronous operation
   */
  @discardableResult func search(query: Query, requestOptions: RequestOptions? = nil, completion: @escaping ResultCallback<SearchResponse>) -> Operation & TransportTask {
    let command = Command.Search.Search(indexName: name, query: query, requestOptions: requestOptions)
    return launch(command, completion: completion)
  }
  
  /**
   Method used for querying an index.

   - Parameter query: The Query used to search.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Parameter completion: Result completion
   - Returns: SearchResponse object
   */
  @discardableResult func search(query: Query, requestOptions: RequestOptions? = nil) throws -> SearchResponse {
    let command = Command.Search.Search(indexName: name, query: query, requestOptions: requestOptions)
    return try launch(command)
  }
  
  //MARK: - Browse
  
  /**
   Get all index content without any record limit. Can be used for backups.
   
   - Note: The browse method is an alternative to the Search index method.
   If you need to retrieve the full content of your index (for backup, SEO purposes or for running a script on it),
   you should use this method instead.
   Results are ranked by attributes and custom ranking.
   But for performance reasons, there is no ranking based on:
   - distinct
   - typo-tolerance
   - number of matched words
   - proximity
   - geo distance
  
   You shouldn’t use this method for building a search UI.
   The analytics API does not collect data from browse method usage.
   If you need to retrieve more than 1,000 results, you should look into the
   [paginationLimitedTo](https://www.algolia.com/doc/api-reference/api-parameters/paginationLimitedTo/) parameter.
  
   If more records are available, SearchResponse.cursor will not be null.
  
   - Parameter query: The Query used to search.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Parameter completion: Result completion
   - Returns: SearchResponse object
   */
  @discardableResult func browse(query: Query, requestOptions: RequestOptions? = nil, completion: @escaping ResultCallback<SearchResponse>) -> Operation & TransportTask {
    let command = Command.Search.Browse(indexName: name, query: query, requestOptions: requestOptions)
    return launch(command, completion: completion)
  }
  
  /**
   Get all index content without any record limit. Can be used for backups.
   
   - Parameter query: The Query used to search.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Parameter completion: Result completion
   - Returns: Launched asynchronous operation
   */
  @discardableResult func browse(query: Query, requestOptions: RequestOptions? = nil) throws -> SearchResponse {
    let command = Command.Search.Browse(indexName: name, query: query, requestOptions: requestOptions)
    return try launch(command)
  }
  
  /**
   Get all index content without any record limit. Can be used for backups.
   
   - Parameter cursor: Cursor indicating the location to resume browsing from.
   Must match the value returned by the previous call to browse SearchResponse.cursor
   - Parameter requestOptions: Configure request locally with RequestOptions
   - Parameter completion: Result completion
   - Returns: Launched asynchronous operation
   */
  @discardableResult func browse(cursor: Cursor, requestOptions: RequestOptions? = nil, completion: @escaping ResultCallback<SearchResponse>) -> Operation & TransportTask {
    let command = Command.Search.Browse(indexName: name, cursor: cursor, requestOptions: requestOptions)
    return launch(command, completion: completion)
  }
  
  /**
   Get all index content without any record limit. Can be used for backups.
   
   - Parameter cursor: Cursor indicating the location to resume browsing from.
   Must match the value returned by the previous call to browse SearchResponse.cursor.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Returns: SearchResponse object
   */
  @discardableResult func browse(cursor: Cursor, requestOptions: RequestOptions? = nil) throws -> SearchResponse {
    let command = Command.Search.Browse(indexName: name, cursor: cursor, requestOptions: requestOptions)
    return try launch(command)
  }
  
  //MARK: - Search for facets
  
  /**
   Search for a set of values within a given facet attribute. Can be combined with a query. This
   method enables you to search through the values of a facet attribute, selecting only a subset
   of those values that meet a given criteria.
   
   - Parameter attrbute: The Attribute to facet on.
   - Parameter facetQuery: The facetQuery used to search for facets.
   - Parameter searchQuery: The Query to filter results.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Parameter completion: Result completion.
   - Returns: Launched asynchronous operation.
   */
  @discardableResult func searchForFacetValues(of attribute: Attribute, matching facetQuery: String, applicableFor searchQuery: Query? = nil, requestOptions: RequestOptions? = nil, completion: @escaping ResultCallback<FacetSearchResponse>) -> Operation & TransportTask {
    let command = Command.Search.SearchForFacets(indexName: name, attribute: attribute, facetQuery: facetQuery, query: searchQuery, requestOptions: requestOptions)
    return launch(command, completion: completion)
  }
  
  /**
   Search for a set of values within a given facet attribute. Can be combined with a query. This
   method enables you to search through the values of a facet attribute, selecting only a subset
   of those values that meet a given criteria.
   
   - Parameter attrbute: The Attribute to facet on.
   - Parameter facetQuery: The facetQuery used to search for facets.
   - Parameter searchQuery: The Query to filter results.
   - Parameter requestOptions: Configure request locally with RequestOptions.
   - Returns: FacetSearchResponse  object.
   */
  @discardableResult func searchForFacetValues(of attribute: Attribute, matching facetQuery: String, applicableFor searchQuery: Query? = nil, requestOptions: RequestOptions? = nil) throws -> FacetSearchResponse {
    let command = Command.Search.SearchForFacets(indexName: name, attribute: attribute, facetQuery: facetQuery, query: searchQuery, requestOptions: requestOptions)
    return try launch(command)
  }
  
  //MARK: - Find object
  
  /**
   Find object searches iteratively through the search response `Hits` field to find the first
   response hit that would match against the given `predicate` function.
   
   - Note: If no object has been found within the first result set, the function will perform a new
   search operation on the next page of results, if any, until a matching object is found or the
   end of results, whichever happens first.
   To prevent the iteration through pages of results, `paginate` parameter can be set to
   false. This will stop the function at the end of the first page of search results even if no
   object does match.
   
   - Parameter predicate: The predicate to match
   - Parameter query: The search Query
   - Parameter paginate: Should the method paginate or not
   - Parameter requestOptions: Configure request locally with RequestOptions
   - Parameter completion: Result completion
   - Returns: Launched asynchronous operation
   */
  @discardableResult func findObject<T: Codable>(matching predicate: @escaping (T) -> Bool, for query: Query, paginate: Bool = true, requestOptions: RequestOptions? = nil, completion: @escaping ResultCallback<HitWithPosition<T>?>) -> Operation {
    let operation = BlockOperation {
      completion(.init { try self.findObject(matching: predicate, for: query, paginate: paginate, requestOptions: requestOptions) })
    }
    queue.addOperation(operation)
    return operation
  }
  
  /**
    Find object searches iteratively through the search response `Hits` field to find the first
    response hit that would match against the given `predicate` function.
   
   - Parameter predicate: The predicate to match
   - Parameter query: The search Query
   - Parameter paginate: Should the method paginate or not
   - Parameter requestOptions: Configure request locally with RequestOptions
   - Returns: HitWithPosition  object
   */
  @discardableResult func findObject<T: Codable>(matching predicate: (T) -> Bool, for query: Query, paginate: Bool = true, requestOptions: RequestOptions? = nil) throws -> HitWithPosition<T>? {
    
    let results = try search(query: query)
    let hits: [T] = try results.extractHits()
    
    if let found = hits
      .enumerated()
      .first(where: {( _, object) in predicate(object)})
      .flatMap({ HitWithPosition(hit: $0.element, page: query.page ?? 0, position: $0.offset) }) {
      return found
    }
    
    let currentPage = query.page ?? 0
    let totalPageCount = (results.nbPages ?? 1)
    
    guard currentPage + 1 < totalPageCount, paginate else { return nil }
    
    let nextPageQuery = query.set(\.page, to: currentPage + 1)
    
    return try findObject(matching: predicate, for: nextPageQuery, requestOptions: requestOptions)
  }
  
}
