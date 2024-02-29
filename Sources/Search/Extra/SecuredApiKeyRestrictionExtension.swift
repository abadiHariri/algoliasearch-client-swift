import Core
import Foundation

public extension SecuredAPIKeyRestrictions {
    func toURLEncodedString() throws -> String {
        var queryDictionary: [String: Any] = [:]

        if let searchParams {
            let searchParamsData = try CodableHelper.jsonEncoder.encode(searchParams)
            guard let searchParamsDictionary = try JSONSerialization.jsonObject(
                with: searchParamsData,
                options: .fragmentsAllowed
            ) as? [String: Any] else {
                throw AlgoliaError.runtimeError("Unable to encode Secured API Key restrictions search parameters")
            }

            queryDictionary = searchParamsDictionary
        }

        if let filters {
            queryDictionary["filters"] = filters
        }
        if let validUntil {
            queryDictionary["validUntil"] = Int(validUntil)
        }
        if let restrictIndices {
            queryDictionary["restrictIndices"] = restrictIndices.joined(separator: ",")
        }
        if let restrictSources {
            queryDictionary["restrictSources"] = restrictSources
        }
        if let userToken {
            queryDictionary["userToken"] = userToken
        }

        return (APIHelper.mapValuesToQueryItems(queryDictionary) ?? [])
            .map { "\($0.name)=\($0.value ?? "null")" }
            .joined(separator: "&")
    }
}