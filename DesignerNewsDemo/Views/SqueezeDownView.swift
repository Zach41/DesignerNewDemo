//
//  SqueezeDownView.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 2016/9/10.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

class SqueezeDownView: UIView, Springable {
    var delay: NSTimeInterval = 0.0
    var duration: NSTimeInterval = 0.0
    var damping: CGFloat = 0.6
    var velocity: CGFloat = 0.7
    var offsetX: CGFloat = 0.0
    var offsetY: CGFloat = 0.0
    var scaleX: CGFloat = 1.0
    var scaleY: CGFloat = 1.0
    var rotate: CGFloat = 0.0
    var opacity: CGFloat = 1.0
    var animateFrom: Bool = true
    
    lazy private var spring: SpringAnimation = SpringAnimation(view: self)
    
    func squeezeDown(completion: Void -> Void) {
        duration = 0.7
        offsetY = -300
        scaleY = 1.5
        
        spring.animate(completion)
    }
    
    func fallDown(completion: Void -> Void) {
        duration = 0.7
        rotate = CGFloat(M_PI_2) / 3.0
        offsetY = 600
        damping = 0.7
        velocity = 0.7
        opacity = 0.5
        animateFrom = false
        
        spring.animate(completion)
    }
    
}
