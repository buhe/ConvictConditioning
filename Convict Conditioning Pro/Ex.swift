//
//  Ex.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2023/2/18.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

