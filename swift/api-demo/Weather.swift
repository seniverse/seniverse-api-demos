//
//  Weather.swift
//

import Foundation

enum WeatherParseError: Error {
    case ParseError
    case HttpError
}

struct Weather: Codable {
    var results = [WeatherNow]()
}

struct WeatherNow: Codable {
    var location: Location
    var now: Now
    var lastUpdate: String

    enum CodingKeys: String, CodingKey {
        case location
        case now
        case lastUpdate = "last_update"
    }
}

struct Location: Codable {
    var name: String
    var id: String
    var timezone: String
    var path: String
}

struct Now: Codable {
    var code: String
    var temperature: String
    var text: String
}

