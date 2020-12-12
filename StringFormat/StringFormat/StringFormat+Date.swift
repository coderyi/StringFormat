//
//  StringFormat+Date.swift
//  StringFormat
//
//  Created by coderyi on 2020/12/12.
//

import Foundation

public enum PresentationTimeFormat {
    case regular
    case military
}

public enum PresentationDateFormat {
    case monthFirst
    case dayFirst
}

extension StringFormat {
    
    public class func stringForTimestamp(day: Int32, month: Int32, year: Int32, dateFormat: PresentationDateFormat, dateSeparator: String) -> String {
        let separator = dateSeparator
        switch dateFormat {
        case .monthFirst:
            return String(format: "%d%@%d%@%02d", month, separator, day, separator, year - 100)
        case .dayFirst:
            return String(format: "%d%@%02d%@%02d", day, separator, month, separator, year - 100)
        }
    }

    public class func stringForTimestamp(day: Int32, month: Int32, dateFormat: PresentationDateFormat, dateSeparator: String) -> String {
        let separator = dateSeparator
        switch dateFormat {
        case .monthFirst:
            return String(format: "%d%@%d", month, separator, day)
        case .dayFirst:
            return String(format: "%d%@%02d", day, separator, month)
        }
    }

    public class func stringForShortTimestamp(hours: Int32, minutes: Int32, timeFormat: PresentationTimeFormat) -> String {
        switch timeFormat {
        case .regular:
            let hourString: String
            if hours == 0 {
                hourString = "12"
            } else if hours > 12 {
                hourString = "\(hours - 12)"
            } else {
                hourString = "\(hours)"
            }

            let periodString: String
            if hours >= 12 {
                periodString = "PM"
            } else {
                periodString = "AM"
            }
            if minutes >= 10 {
                return "\(hourString):\(minutes) \(periodString)"
            } else {
                return "\(hourString):0\(minutes) \(periodString)"
            }
        case .military:
            return String(format: "%02d:%02d", arguments: [Int(hours), Int(minutes)])
        }
    }

    public class func stringForDate(timestamp: Int32, languageCode: String) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = localeWithLanguageCode(languageCode)
        return formatter.string(from: Date(timeIntervalSince1970: Double(timestamp)))
    }

    public class func stringForDate(date: Date, timeZone: TimeZone? = TimeZone(secondsFromGMT: 0), languageCode: String) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        formatter.timeZone = timeZone
        formatter.locale = localeWithLanguageCode(languageCode)
        return formatter.string(from: date)
    }

    public class func stringForDateWithoutYear(date: Date, timeZone: TimeZone? = TimeZone(secondsFromGMT: 0), languageCode: String) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.timeZone = timeZone
        formatter.locale = localeWithLanguageCode(languageCode)
        formatter.setLocalizedDateFormatFromTemplate("MMMMd")
        return formatter.string(from: date)
    }

    public class func roundDateToDays(_ timestamp: Int32) -> Int32 {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        var components = calendar.dateComponents(Set([.era, .year, .month, .day]), from: Date(timeIntervalSince1970: Double(timestamp)))
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        guard let date = calendar.date(from: components) else {
            assertionFailure()
            return timestamp
        }
        return Int32(date.timeIntervalSince1970)
    }
}
