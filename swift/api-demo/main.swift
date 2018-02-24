//
//  main.swift
//
//  Created by ecmadao on 2018/2/24.
//  Copyright © 2018年 ecmadao. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    func hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
        let data = Data(bytes: digest)
        return data.base64EncodedString()
    }
}
print("Fetching weather now api")
SeniverseAPI.fetchWeatherNow(location: "Beijing")

