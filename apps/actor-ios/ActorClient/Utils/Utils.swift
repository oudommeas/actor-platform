//
//  Utils.swift
//  ActorClient
//
//  Created by Danil Gontovnik on 4/2/15.
//  Copyright (c) 2015 Actor LLC. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    class func isRetina() -> Bool {
        return UIScreen.mainScreen().scale > 1
    }
    
    class func retinaPixel() -> CGFloat {
        if Utils.isRetina() {
            return 0.5
        }
        return 1.0
    }
    
}