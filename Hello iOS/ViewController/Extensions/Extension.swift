//
//  Extension.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/26.
//  Copyright © 2019 Tony. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        print("key:\(self)")
        //return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
        return NSLocalizedString(self, comment: "")
    }
}
