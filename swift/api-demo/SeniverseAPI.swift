//
//  SeniverseAPI.swift
//
//  Created by ecmadao on 2018/2/24.
//  Copyright © 2018年 ecmadao. All rights reserved.
//

import Foundation

struct SeniverseAPI {
    private static let baseURL: String = "https://api.seniverse.com/v3"
    private static let secretKey: String = "4r9bergjetiv1tsd"
    private static let uid: String = "U785B76FC9"
    private static let session: URLSession = {
        return URLSession.shared
    }()

    private static func buildQuery(parameters: [String:String]?) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        var queryString = ""

        let now = Date()
        let timestamp = String(Int(floor(now.timeIntervalSince1970)))
        queryString += "ts=\(timestamp)&uid=\(uid)"
        queryItems += [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "uid", value: uid)
        ]
        let sig = queryString.hmac(key: secretKey)
        queryItems.append(URLQueryItem(name: "sig", value: sig))

        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }

        return queryItems
    }

    private static func getRequestURL(route: String, parameters: [String:String]?) -> URL {
        var components = URLComponents(string: "\(baseURL)/\(route)")
        components?.queryItems = buildQuery(parameters: parameters)
        return (components?.url)!
    }

    static func fetchWeatherNow(location: String) -> Void {
        let url = getRequestURL(route: "weather/now.json", parameters: ["location" : location])
        print(" ============ Request URL ============ ")
        print(url)
        print(" ================== ")

        let request = URLRequest(url: url)
        let semaphore = DispatchSemaphore(value: 0)

        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            if let jsonData = data {
                let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: [])
                print(jsonObject)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}
