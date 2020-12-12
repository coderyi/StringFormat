//
//  StringFormat+DeviceType.swift
//  StringFormat
//
//  Created by coderyi on 2020/12/12.
//

import UIKit

extension StringFormat {

    public class func stringForDeviceType() -> String {
        let model = UIDevice.current.model.lowercased()
        if model.contains("ipad") {
            return "iPad"
        } else if model.contains("ipod") {
            return "iPod touch"
        } else {
            return "iPhone"
        }
    }
}
