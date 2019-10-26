//
//  PostRequest.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/23/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Alamofire

class Request<T: Decodable> {
    class func send(url: String, method: String, params: [String : String]? = nil) throws -> T {
        let semaphore = DispatchSemaphore(value: 0)
        
        var data: Data?
        var error: AFError?
        
        var httpMethod: HTTPMethod
        
        switch method.lowercased() {
        case "post":
            httpMethod = .post
        case "get":
            httpMethod = .get
        default:
            httpMethod = .post
        }
        
        AF.request(url, method: httpMethod, parameters: params, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success:
                    data = response.data
                case let .failure(e):
                    error = e
                    print(e)
                }
                semaphore.signal()
        }
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        if let error = error {
            if error.isInvalidURLError {
                throw NetworkError.url
            } else if let code = error.responseCode, code > 300 {
                throw NetworkError.statusCode
            } else {
                throw NetworkError.other
            }
        }
        
        guard let tData = data else {
            throw NetworkError.other
        }
        
        let decoder = JSONDecoder()
        let t = try decoder.decode(T.self, from: tData)
        
        return t
    }
}
