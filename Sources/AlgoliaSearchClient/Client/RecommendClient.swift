//
//  RecommendClient.swift
//
//
//  Created by Vladislav Fitc on 31/08/2021.
//

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Client to perform recommend operations.
public struct RecommendClient: Credentials {

  let transport: Transport
  let operationLauncher: OperationLauncher
  let configuration: Configuration

  public var applicationID: ApplicationID {
    return transport.applicationID
  }

  public var apiKey: APIKey {
    return transport.apiKey
  }

  public init(appID: ApplicationID, apiKey: APIKey) {

    let configuration = SearchConfiguration(applicationID: appID, apiKey: apiKey)

    let sessionConfiguration: URLSessionConfiguration = .default
    sessionConfiguration.httpAdditionalHeaders = configuration.defaultHeaders
    let session = URLSession(configuration: sessionConfiguration)

    self.init(configuration: configuration, requester: session)

  }

  public init(configuration: SearchConfiguration,
              requester: HTTPRequester = URLSession(configuration: .default), hostsExpirationDelay: TimeInterval = .minutes(5)) {

    let queue = OperationQueue()
    queue.qualityOfService = .userInitiated
    let operationLauncher = OperationLauncher(queue: queue)

      let retryStrategy = AlgoliaRetryStrategy(configuration: configuration,hostsExpirationDelay: hostsExpirationDelay)

    let httpTransport = HTTPTransport(requester: requester,
                                      configuration: configuration,
                                      retryStrategy: retryStrategy,
                                      credentials: configuration,
                                      operationLauncher: operationLauncher)
    self.init(transport: httpTransport, operationLauncher: operationLauncher, configuration: configuration)

  }

  init(transport: Transport,
       operationLauncher: OperationLauncher,
       configuration: Configuration) {
    self.transport = transport
    self.operationLauncher = operationLauncher
    self.configuration = configuration
  }

  /// Initialize an Index configured with SearchConfiguration.
  public func index(withName indexName: IndexName) -> Index {
    return Index(name: indexName, transport: transport, operationLauncher: operationLauncher, configuration: configuration)
  }

}

extension RecommendClient: TransportContainer {}

extension RecommendClient {

  @discardableResult func launch<O: Operation>(_ operation: O) -> O {
    return operationLauncher.launch(operation)
  }

  func launch<O: OperationWithResult>(_ operation: O) throws -> O.ResultValue {
    return try operationLauncher.launchSync(operation)
  }

}

public extension RecommendClient {

  /**
   Returns recommendations.
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - parameter completion: Result completion
   - returns: Launched asynchronous operation
   */
  @discardableResult func getRecommendations(options: [RecommendationsOptions],
                                             requestOptions: RequestOptions? = nil,
                                             completion: @escaping ResultCallback<SearchesResponse>) -> Operation {
    let command = Command.Recommend.GetRecommendations(options: options, requestOptions: requestOptions)
    return execute(command, completion: completion)
  }
    
  @discardableResult func getRecommendationAsync(options: [RecommendationsOptions], requestOptions: RequestOptions? = nil) async throws -> SearchesResponse {
        let searchOperations: SearchOperations = .init()
        
        return try await withTaskCancellationHandler {
            
            return try await withCheckedThrowingContinuation { continuation in
                let operation = getRecommendations(options:options,requestOptions: requestOptions) { (result: Result<SearchesResponse, Error>) in
                    switch result {
                    case .success(let response):
                        continuation.resume(returning: response)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
                
                Task {await searchOperations.assign(operation: operation)}
            }
        } onCancel: {
            Task {await searchOperations.cancel()}
        }
         
    }
  /**
   Returns recommendations.
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - returns: SearchesResponse object
   */
  @discardableResult func getRecommendations(options: [RecommendationsOptions],
                                             requestOptions: RequestOptions? = nil) throws -> SearchesResponse {
    let command = Command.Recommend.GetRecommendations(options: options, requestOptions: requestOptions)
    return try execute(command)
  }

    
    @discardableResult func getRecommendationAsync(option: RecommendationsOptions, requestOptions: RequestOptions? = nil) async throws -> SearchesResponse {
        return try await getRecommendationAsync(options: [option], requestOptions: requestOptions)
    }
    
  /**
   Returns [Related Products](https://algolia.com/doc/guides/algolia-ai/recommend/#related-products).
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - parameter completion: Result completion
   - returns: Launched asynchronous operation
   */
  @discardableResult func getRelatedProducts(options: [RelatedProductsOptions],
                                             requestOptions: RequestOptions? = nil,
                                             completion: @escaping ResultCallback<SearchesResponse>) -> Operation {
    return getRecommendations(options: options.map(\.recommendationsOptions),
                              requestOptions: requestOptions,
                              completion: completion)
  }
    
    @discardableResult func getRelatedProductsAsync(option: RelatedProductsOptions,
                                               requestOptions: RequestOptions? = nil) async throws -> SearchesResponse {
        return try await getRecommendationAsync(options: [option.recommendationsOptions], requestOptions: requestOptions)
    }
    
    
    @discardableResult func getTrendingItemsAsync(option: TrendingItemsOptions,
                                               requestOptions: RequestOptions? = nil) async throws -> SearchesResponse {
        return try await getRecommendationAsync(options: [option.recommendationsOptions],requestOptions: requestOptions)
    }
  /**
   Returns [Related Products](https://algolia.com/doc/guides/algolia-ai/recommend/#related-products).
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - returns: SearchesResponse object
   */
  @discardableResult func getRelatedProducts(options: [RelatedProductsOptions],
                                             requestOptions: RequestOptions? = nil) throws -> SearchesResponse {
    return try getRecommendations(options: options.map(\.recommendationsOptions),
                                  requestOptions: requestOptions)
  }

  /**
   Returns [Frequently Bought Together](https://algolia.com/doc/guides/algolia-ai/recommend/#frequently-bought-together) products.
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - parameter completion: Result completion
   - returns: Launched asynchronous operation
   */
  @discardableResult func getFrequentlyBoughtTogether(options: [FrequentlyBoughtTogetherOptions],
                                                      requestOptions: RequestOptions? = nil,
                                                      completion: @escaping ResultCallback<SearchesResponse>) -> Operation {
    return getRecommendations(options: options.map(\.recommendationsOptions),
                              requestOptions: requestOptions,
                              completion: completion)
  }

    @discardableResult func getFrequentlyBoughtTogetherAsync(options: [RelatedProductsOptions],
                                               requestOptions: RequestOptions? = nil) async throws -> SearchesResponse {
      return try await getRecommendationAsync(options: options.map(\.recommendationsOptions),
                                              requestOptions: requestOptions)
    }
    
  /**
   Returns [Frequently Bought Together](https://algolia.com/doc/guides/algolia-ai/recommend/#frequently-bought-together) products.
   
   - parameter options: Recommend request options
   - parameter requestOptions: Configure request locally with RequestOptions
   - returns: SearchesResponse object
   */
  @discardableResult func getFrequentlyBoughtTogether(options: [FrequentlyBoughtTogetherOptions],
                                                      requestOptions: RequestOptions? = nil) throws -> SearchesResponse {
    return try getRecommendations(options: options.map(\.recommendationsOptions),
                                  requestOptions: requestOptions)
  }

}

public actor SearchOperations {
    var operation: Operation?
    
    public init() {
       
    }
    
    
    public func assign(operation: Operation?) {
        
        cancel()
        
        self.operation = operation
    }
    
    
    public func cancel () {
        operation?.cancel()
        operation = nil
    }
}
