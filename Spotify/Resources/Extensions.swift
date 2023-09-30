//
//  Extensions.swift
//  Spotify
//
//  Created by Alexander Nitiola on 30/09/2023.
//

import Foundation;
import UIKit;

extension UIView {
    var width: CGFloat {
        return frame.size.width;
    }
    
    var height: CGFloat {
        return frame.size.height;
    }
    
    var left: CGFloat {
        return frame.origin.x;
    }
    
    var right: CGFloat {
        return left + width;
    }
    
    var top: CGFloat {
        return frame.origin.y;
    }
    
    var bottom: CGFloat {
        return top + height;
    }
}

extension String {
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
