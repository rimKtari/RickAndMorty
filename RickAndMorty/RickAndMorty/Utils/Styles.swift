//
//  Styles.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//
import UIKit
import SwiftUI

struct Styles {
    
    struct uiColor {
        static let lightBlue = UIColor(hexValue: 0xCADFEA)
        static let lightRed = UIColor(hexValue: 0xEDD4D4)
    }
    
    struct Colors {
        static let lightBlue = Color(uiColor.lightBlue)
        static let lightRed = Color(uiColor.lightRed)
    }

}

public extension UIColor {
    
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat=1.0) {
        self.init(red: CGFloat(redInt)/255.0, green: CGFloat(greenInt)/255.0, blue: CGFloat(blueInt)/255.0, alpha: alpha)
    }
    
    convenience init(hexValue: Int) {
        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        
        self.init(redInt: red, greenInt: green, blueInt: blue)
    }
}
