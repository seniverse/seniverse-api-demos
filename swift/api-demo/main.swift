//
//  main.swift
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
Seniverse.API.weatherNow(location: "Beijing")

