//
//  StringFormat+Locale.swift
//  StringFormat
//
//  Created by coderyi on 2020/12/12.
//

import Foundation

extension StringFormat {

    private class var systemLocaleRegionSuffix: String {
        let identifier = Locale.current.identifier
        if let range = identifier.range(of: "_") {
            return String(identifier[range.lowerBound...])
        } else {
            return ""
        }
    }

    public class var usEnglishLocale: Locale {
        Locale(identifier: "en_US")
        
    }

    public class func localeWithLanguageCode(_ languageCode: String) -> Locale {
        let code = languageCode + systemLocaleRegionSuffix
        return Locale(identifier: code)
    }
}
