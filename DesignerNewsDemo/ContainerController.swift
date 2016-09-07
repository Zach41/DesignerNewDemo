//
//  ViewController.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 16/9/5.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

private let MenuSegue = "MenuSegue"

class ContainerController: UIViewController {
    
    @IBOutlet weak var menu: MenuControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu.menuButtonAction = { [weak self] (_, state) in
            if state == .MenuToShow {
                print("Showing")
                self!.performSegueWithIdentifier(MenuSegue, sender: nil)
            } else {
                print("Closing")
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == MenuSegue {
            let menuViewController = segue.destinationViewController as! MenuViewController
            menuViewController.delegate = self
        }
    }
}

extension ContainerController : MenuItemClickedDelegate {
    func menuItemDidClickTopStories(controller: MenuViewController, menuItem: UIButton) {
        print("Stories")
        self.menu.menuAnimation()
    }
    
    func menuItemDidClickRecent(controller: MenuViewController, menuItem: UIButton) {
        print("Recent")
        self.menu.menuAnimation()
    }
    
    func menuItemDidClickLearn(controller: MenuViewController, menuItem: UIButton) {
        print("Learn")
        self.menu.menuAnimation()
    }
    
    func menuItemDidClickLogin(controller: MenuViewController, menuItem: UIButton) {
        print("Login")
        self.menu.menuAnimation()
    }
    
    func menuItemDidTapBackground(controller: MenuViewController) {
        print("Background")
        self.menu.menuAnimation()
    }
}

