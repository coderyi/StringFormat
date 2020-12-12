//
//  String+File.swift
//  StringFormat
//
//  Created by coderyi on 2020/12/12.
//

import Foundation

extension String {

    static var FilePrefix = "file://"

    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    public var isMarkdown: Bool {
        return hasSuffix(".md") || hasSuffix(".markdown")
    }

    public var isBaseFile: Bool {
        return self == "file:///" || self == "file://"
    }

    public var isWebLink: Bool {
        return contains("http")
    }

    public var removingPercentEncoding: String {
        return self.removingPercentEncoding ?? self
    }

    public var isWhiteSpace: Bool {
         return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    func trim() -> String {
      return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

}
