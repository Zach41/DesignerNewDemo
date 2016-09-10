//
//  SpringAnimation.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 2016/9/10.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

@objc protocol Springable {
    var delay : NSTimeInterval {get set}
    var duration : NSTimeInterval {get set}
    var damping : CGFloat {get set}
    var velocity : CGFloat {get set}
    var offsetX : CGFloat {get set}
    var offsetY : CGFloat {get set}
    var scaleX : CGFloat {get set}
    var scaleY : CGFloat {get set}
    var rotate : CGFloat {get set}
//    var timingfunction : CAMediaTimingFunction {get set}
    var opacity : CGFloat {get set}
    var animateFrom : Bool {get set}
    
    // UIView
    var layer : CALayer {get}
    var transform : CGAffineTransform {get set}
    var alpha : CGFloat {get set}
}

class SpringAnimation: NSObject {
    private unowned var view : Springable
    
    init(view : Springable) {
        self.view = view
        super.init()
    }
    
    // convvenient getters and setters
    private var delay : NSTimeInterval {
        get {return self.view.delay} set {self.view.delay = newValue}
    }
    
    private var duration : NSTimeInterval {
        get {return self.view.duration} set {self.view.duration = newValue}
    }
    
    private var damping : CGFloat {
        get {return self.view.damping} set {self.view.damping = damping}
    }
    
    private var velocity : CGFloat {
        get {return self.view.velocity} set {self.view.velocity = newValue}
    }
    
    private var offsetX : CGFloat {
        get {return self.view.offsetX} set {self.view.offsetX = newValue}
    }
    
    private var offsetY : CGFloat {
        get {return self.view.offsetY} set {self.view.offsetY = newValue}
    }
    
    private var scaleX : CGFloat {
        get {return self.view.scaleX} set {self.view.scaleX = newValue}
    }
    
    private var scaleY : CGFloat {
        get {return self.view.scaleY} set {self.view.scaleY = newValue}
    }
    
    private var rotate : CGFloat {
        get {return self.view.rotate} set {self.view.rotate = newValue}
    }
    
//    private var timingFunction: CAMediaTimingFunction {
//        get {return self.view.timingfunction} set {self.view.timingfunction = newValue}
//    }
    
    private var opacity : CGFloat {
        get {return self.view.opacity} set {self.view.opacity = newValue}
    }
    
    private var animateFrom : Bool {
        get {return self.view.animateFrom} set {self.view.animateFrom = newValue}
    }
    
    // Mark: animations
    
    func animate(completion : Void -> Void) {
        if animateFrom {
            let translate = CGAffineTransformMakeTranslation(offsetX, offsetY)
            let scale     = CGAffineTransformMakeScale(scaleX, scaleY)
            let rotate    = CGAffineTransformMakeRotation(self.rotate)
            let translateAndScale = CGAffineTransformConcat(translate, scale)
            self.view.transform = CGAffineTransformConcat(rotate, translateAndScale)
            self.view.alpha = opacity            
        }
        UIView.animateWithDuration(self.duration,
                                   delay: self.delay,
                                   usingSpringWithDamping: self.damping,
                                   initialSpringVelocity: self.velocity,
                                   options: .CurveEaseInOut,
                                   animations: {
                                    if self.animateFrom {
                                        self.view.transform = CGAffineTransformIdentity
                                        self.view.alpha = 1.0
                                    } else {
                                        let translate = CGAffineTransformMakeTranslation(self.offsetX, self.offsetY)
                                        let scale     = CGAffineTransformMakeScale(self.scaleX, self.scaleY)
                                        let rotate    = CGAffineTransformMakeRotation(self.rotate)
                                        let translateAndScale = CGAffineTransformConcat(translate, scale)
                                        self.view.transform = CGAffineTransformConcat(rotate, translateAndScale)
                                        self.view.alpha = self.opacity
                                    }
            }, completion: { finished in
                completion()
                self.resetAll()
        })
    }
    
    func resetAll() {
        offsetX = 0
        offsetY = 0
        opacity = 0
        rotate  = 0
        scaleX  = 1
        scaleY  = 1
        damping = 0.6
        velocity = 0.7
        delay   = 0
        duration = 0.7
    }
}
