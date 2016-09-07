//
//  MenuControl.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 16/9/5.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

enum MenuState {
    case MenuToShow, MenuToClose
}

class MenuControl: UIControl {
    
    var menuButtonAction : ((MenuControl, MenuState) -> Void)?
    
    private let duration = 0.7
    
    @IBInspectable var color : UIColor = UIColor.whiteColor() {
        didSet {
            topView.backgroundColor    = color
            centerView.backgroundColor = color
            bottomView.backgroundColor = color
        }
    }
    
    private let topView    = UIView()
    private let centerView = UIView()
    private let bottomView = UIView()
    
    var isDisplaying : Bool {
        return centerView.alpha == 0
    }
    
    func touchMenuInside(sender : AnyObject) {
        if isDisplaying {
            menuAnimation()
            menuButtonAction?(self, .MenuToClose)
        } else {
            closeAnimation()
            menuButtonAction?(self, .MenuToShow)
            
        }
    }
    
    override func layoutSubviews() {
        if subviews.isEmpty {
            setupSubviews()
            setAction()
        }
    }
    
    func closeAnimation() {
        UIView.animateWithDuration(duration,
                                   delay: 0,
                                   usingSpringWithDamping: 0.6,
                                   initialSpringVelocity: 0.7,
                                   options: .CurveEaseInOut,
                                   animations: {
                                    self.topView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) * 5)
                                    self.topView.center    = self.centerView.center
                                    
                                    self.centerView.alpha  = 0.0
                                    
                                    self.bottomView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4) * 5)
                                    self.bottomView.center    = self.centerView.center
            }, completion: nil)
    }
    
    func menuAnimation() {
        UIView.animateWithDuration(duration,
                                   delay: 0,
                                   usingSpringWithDamping: 0.6,
                                   initialSpringVelocity: 0.7,
                                   options: .CurveEaseInOut,
                                   animations: {
                                    self.topView.transform = CGAffineTransformIdentity
                                    
                                    let centerX = self.bounds.midX
                                    self.topView.center = CGPointMake(centerX, self.topView.bounds.midY)
                                    
                                    self.centerView.alpha = 1.0
                                    
                                    self.bottomView.transform = CGAffineTransformIdentity
                                    self.bottomView.center = CGPointMake(centerX, self.bounds.maxY - self.bottomView.bounds.midY)
                                    
            }, completion: nil)
    }

    
    // MARK: Private
    private func setAction() {
        addTarget(self, action: #selector(touchMenuInside), forControlEvents: .TouchUpInside)
    }
    
    private func setupSubviews() {
        backgroundColor = UIColor.clearColor()
        
        let height = CGFloat(2)
        let width  = bounds.width
        
        topView.frame = CGRectMake(0, bounds.minY, width, height)
        topView.userInteractionEnabled = false
        topView.backgroundColor = color
        
        centerView.frame = CGRectMake(0, bounds.midY - round(height / 2.0), width, height)
        centerView.userInteractionEnabled = false
        centerView.backgroundColor = color
        
        bottomView.frame = CGRectMake(0, bounds.maxY - height, width, height)
        bottomView.userInteractionEnabled = false
        bottomView.backgroundColor = color
        
        addSubview(topView)
        addSubview(centerView)
        addSubview(bottomView)
    }
    
}
