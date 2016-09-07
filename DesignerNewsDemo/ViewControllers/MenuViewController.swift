//
//  MenuViewController.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 16/9/7.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit
import Spring

protocol MenuItemClickedDelegate : class {
    func menuItemDidClickTopStories(controller: MenuViewController, menuItem: UIButton)
    func menuItemDidClickRecent(controller: MenuViewController, menuItem: UIButton)
    func menuItemDidClickLearn(controller: MenuViewController, menuItem: UIButton)
    func menuItemDidClickLogin(controller: MenuViewController, menuItem: UIButton)
    func menuItemDidTapBackground(controller: MenuViewController)
}

class MenuViewController: UIViewController {

    weak var delegate : MenuItemClickedDelegate?
    
    @IBOutlet weak var dialogView: SpringView!
    
    @IBOutlet weak var topStoriesBtn: UIButton!
    @IBOutlet weak var recentBtn: UIButton!
    @IBOutlet weak var learnBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button & Gesture Actions
    
    @IBAction func topStoriesBtnTouched(sender: UIButton) {
        delegate?.menuItemDidClickTopStories(self, menuItem: topStoriesBtn)
        closeAnimation()
    }

    @IBAction func recentBtnTouched(sender: UIButton) {
        delegate?.menuItemDidClickRecent(self, menuItem: recentBtn)
        closeAnimation()
    }
    
    @IBAction func learnBtnTouched(sender: AnyObject) {
        delegate?.menuItemDidClickLearn(self, menuItem: learnBtn)
        closeAnimation()
    }
    
    @IBAction func loginBtnTouched(sender: UIButton) {
        delegate?.menuItemDidClickLogin(self, menuItem: loginBtn)
        closeAnimation()
    }
    
    @IBAction func tapGesture(sender: AnyObject) {
        delegate?.menuItemDidTapBackground(self)
        closeAnimation()
    }
    
    // MARK: private
    private func animateDialog() {
        dialogView.animation = "pop"
        dialogView.animate()
    }
    
    private func closeAnimation() {
        dialogView.animation = "fall"
        dialogView.animate()
        dialogView.animateNext() {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
