//
//  DemoViewController.swift
//  StringFormat
//
//  Created by coderyi on 2020/11/28.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: 1, alpha: 1)

        print(StringFormat.stringForDeviceType())
        print(StringFormat.normalizeArabicNumeralString("12", type: .arabic))
        print(StringFormat.stringForDuration(122))
        print(StringFormat.isValidUrl("https://github.com"))
        var test: String = "hello"
        print(test)
        test = test.rightJustified(width: 6)
        print(test)
        let test1: String = "hello"
        print(test1.persistentHashValue)

        let test2: String = "https://github.com"
        print(test2.isWebLink)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
