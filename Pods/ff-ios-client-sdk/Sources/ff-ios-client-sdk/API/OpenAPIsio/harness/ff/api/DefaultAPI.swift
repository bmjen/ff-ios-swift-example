//
// DefaultAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class DefaultAPI {
    /**
     Authenticate with the admin server.
     
     - parameter authenticationRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authenticate(
        
        authenticationRequest: AuthenticationRequest? = nil,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: AuthenticationResponse?,_ error: Error?) -> Void)
    
    ) {
        authenticateWithRequestBuilder(authenticationRequest: authenticationRequest)
            .execute(apiResponseQueue) { result -> Void in
            
                switch result {
                    case let .success(response):
                        completion(response.body, nil)
                    case let .failure(error):
                        completion(nil, error)
                }
        }
    }

    /**
     Authenticate with the admin server.
     - POST /client/auth
     - Used to retrieve all target segments for certain account id.
     - parameter authenticationRequest: (body)  (optional)
     - returns: RequestBuilder<AuthenticationResponse> 
     */
    open class func authenticateWithRequestBuilder(authenticationRequest: AuthenticationRequest? = nil) -> RequestBuilder<AuthenticationResponse> {
        let path = "/client/auth"
        let URLString = OpenAPIClientAPI.configPath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: authenticationRequest)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<AuthenticationResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    
    /**
     Get feature evaluations for target
     
     - parameter environmentUUID: (path) Unique identifier for the environment object in the API.
     - parameter target: (path) Unique identifier for the target object in the API.
     - parameter cluster: Cluster.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getEvaluations(
        
        environmentUUID: String,
        target: String,
        cluster: String,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: [Evaluation]?,_ error: Error?) -> Void)
    
    ) {
        getEvaluationsWithRequestBuilder(
            
            environmentUUID: environmentUUID,
            target: target,
            cluster: cluster
        
        ).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get feature evaluations for target
     
     - parameter environmentUUID: (path) Unique identifier for the environment object in the API. 
     - parameter feature: (path) Unique identifier for the flag object in the API. 
     - parameter target: (path) Unique identifier for the target object in the API.
     - parameter cluster: Cluster.
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getEvaluationByIdentifier(
        
        environmentUUID: String,
        feature: String,
        target: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        cluster: String,
        completion: @escaping ((_ data: Evaluation?,_ error: Error?) -> Void)
    
    ) {
        getEvaluationByIdentifierWithRequestBuilder(
            
            environmentUUID: environmentUUID,
            feature: feature,
            target: target,
            cluster: cluster
        
        ).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /**
     Get feature evaluations for target
     
     - GET /client/env/{environmentUUID}/target/{target}/evaluations
     - parameter environmentUUID: (path) Unique identifier for the environment object in the API.
     - parameter target: (path) Unique identifier for the target object in the API.
     - parameter cluster: Cluster.
     - returns: RequestBuilder<[Evaluation]>
     */
    open class func getEvaluationsWithRequestBuilder(
        
        environmentUUID: String,
        target: String,
        cluster: String
    
    ) -> RequestBuilder<[Evaluation]> {
        var path = "/client/env/{environmentUUID}/target/{target}/evaluations?cluster=\(cluster)"
        let environmentUUIDPreEscape = "\(APIHelper.mapValueToPathItem(environmentUUID))"
        let environmentUUIDPostEscape = environmentUUIDPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{environmentUUID}", with: environmentUUIDPostEscape, options: .literal, range: nil)
        let targetPreEscape = "\(APIHelper.mapValueToPathItem(target))"
        let targetPostEscape = targetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{target}", with: targetPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.configPath + path
        let parameters: [String:Any] = ["cluster": cluster]
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[Evaluation]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        let req =  requestBuilder.init(
            method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false
        )
        
        NSLog("API getEvaluations: \(req.URLString)")
        return req
    }
    
    /**
     Get feature evaluations for target
     
     - GET /client/env/{environmentUUID}/target/{target}/evaluations/{feature}
     - parameter environmentUUID: (path) Unique identifier for the environment object in the API.
     - parameter feature: (path) Unique identifier for the flag object in the API.
     - parameter target: (path) Unique identifier for the target object in the API.
     - parameter cluster: Cluster.
     - returns: RequestBuilder<Evaluation>
     */
    open class func getEvaluationByIdentifierWithRequestBuilder(
        
        environmentUUID: String,
        feature: String, target: String,
        cluster: String
    
    ) -> RequestBuilder<Evaluation> {
        var path = "/client/env/{environmentUUID}/target/{target}/evaluations/{feature}?cluster=\(cluster)"
        let environmentUUIDPreEscape = "\(APIHelper.mapValueToPathItem(environmentUUID))"
        let environmentUUIDPostEscape = environmentUUIDPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{environmentUUID}", with: environmentUUIDPostEscape, options: .literal, range: nil)
        let featurePreEscape = "\(APIHelper.mapValueToPathItem(feature))"
        let featurePostEscape = featurePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{feature}", with: featurePostEscape, options: .literal, range: nil)
        let targetPreEscape = "\(APIHelper.mapValueToPathItem(target))"
        let targetPostEscape = targetPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{target}", with: targetPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.configPath + path
        let parameters: [String:Any] = ["cluster": cluster]
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Evaluation>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        let req = requestBuilder.init(
            method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false
        )
        
        NSLog("API getEvaluationByIdentifier: \(req.URLString)")
        return req
    }
}