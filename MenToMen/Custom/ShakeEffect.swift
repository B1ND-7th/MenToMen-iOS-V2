/// Shake Effect
/// Created by Mercen on 2022/12/20.

import SwiftUI

// MARK: - Shake Effect
struct ShakeEffect: GeometryEffect {
    var travelDistance: CGFloat = 6
    var numOfShakes: CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let amount = travelDistance * sin(animatableData * .pi * numOfShakes)
        return ProjectionTransform(CGAffineTransform(translationX: amount, y: 0))
    }
}
