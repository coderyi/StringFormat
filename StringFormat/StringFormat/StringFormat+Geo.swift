//
//  StringFormat+Geo.swift
//  StringFormat
//
//  Created by coderyi on 2020/12/12.
//

import Foundation
import MapKit

extension StringFormat {
    public class var geo: Geo {
        Geo()
    }
}
class Geo {
    private var sharedShortDistanceFormatter: MKDistanceFormatter?
    public func shortStringForDistance(languageCode: String, distance: Int32) -> String {
        let distanceFormatter: MKDistanceFormatter
        if let currentDistanceFormatter = sharedShortDistanceFormatter {
            distanceFormatter = currentDistanceFormatter
        } else {
            distanceFormatter = MKDistanceFormatter()
            distanceFormatter.unitStyle = .abbreviated
            sharedShortDistanceFormatter = distanceFormatter
        }
        
        let locale = StringFormat.localeWithLanguageCode(languageCode)
        if distanceFormatter.locale != locale {
            distanceFormatter.locale = locale
        }
        
        let distance = max(1, distance)
        var result = distanceFormatter.string(fromDistance: Double(distance))
        if result.hasPrefix("0 ") {
            result = result.replacingOccurrences(of: "0 ", with: "1 ")
        }
        return result
    }

    private var sharedDistanceFormatter: MKDistanceFormatter?
    public func stringForDistance(languageCode: String, distance: CLLocationDistance) -> String {
        let distanceFormatter: MKDistanceFormatter
        if let currentDistanceFormatter = sharedDistanceFormatter {
            distanceFormatter = currentDistanceFormatter
        } else {
            distanceFormatter = MKDistanceFormatter()
            distanceFormatter.unitStyle = .full
            sharedDistanceFormatter = distanceFormatter
        }
        
        let locale = StringFormat.localeWithLanguageCode(languageCode)
        if distanceFormatter.locale != locale {
            distanceFormatter.locale = locale
        }
        
        return distanceFormatter.string(fromDistance: distance)
    }

}
