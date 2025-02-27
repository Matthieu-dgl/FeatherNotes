//
//  Color+Extension.swift
//  FeatherNotes
//
//  Created by Matthieu on 24.02.2025.
//

import RealmSwift
import SwiftUI

public class PersistableColor: Object, Codable {
    @Persisted public var red: Double
    @Persisted public var green: Double
    @Persisted public var blue: Double
    @Persisted public var alpha: Double

    public convenience init(color: Color) {
        self.init()
        if let uiColor = UIColor(color).cgColor.components {
            red = uiColor[0]
            green = uiColor[1]
            blue = uiColor[2]
            alpha = uiColor.count > 3 ? uiColor[3] : 1.0
        } else {
            red = 0.0
            green = 0.0
            blue = 0.0
            alpha = 1.0
        }
    }

    public var color: Color {
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }

    public var toColor: Color {
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

public extension Color {
    func toPersistableColor() -> PersistableColor {
        return PersistableColor(color: self)
    }
}
