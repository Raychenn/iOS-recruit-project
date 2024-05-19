//
//  Interface.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

struct Interface {
    static func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
