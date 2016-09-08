//
//  ViewController.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 16/9/5.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

private let MenuSegue = "MenuSegue"

private let kStoriesViewControllerID = "StoriesViewController"
private let kRecentViewControllerID  = "RecentViewController"
private let kSearchViewControllerID  = "SearchViewController"


class ContainerController: UIPageViewController {
    
    @IBOutlet weak var menu: MenuControl!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    lazy var _controllers : [StoriesViewController]  = {
        let topStoriesVC = self.storyboard?.instantiateViewControllerWithIdentifier(kStoriesViewControllerID) as! StoriesViewController
        
        let recentVC = self.storyboard?.instantiateViewControllerWithIdentifier(kRecentViewControllerID) as! StoriesViewController
        
        let searchVC = self.storyboard?.instantiateViewControllerWithIdentifier(kSearchViewControllerID) as! StoriesViewController
        
        return [topStoriesVC, recentVC, searchVC]
    }()
    
    private let titles : [String] = ["TopStories", "Recent", "Search"]
    
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
        
        
        setViewControllers([_controllers[0]], direction: .Forward, animated: true, completion: nil)
        
        self.delegate   = self
        self.dataSource = self
        
        self.pageIndicator.numberOfPages = _controllers.count
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

// MARK: UIPageViewController Data Source
extension ContainerController : UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = (_controllers as NSArray).indexOfObject(viewController)
        
        if index > 0 {
            return _controllers[index-1]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = (_controllers as NSArray).indexOfObject(viewController)
        
        if index < _controllers.count-1 {
            return _controllers[index+1]
        }
        return nil
    }
}

// MARK: UIPageViewController Delegate

extension ContainerController : UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if completed {
            let current  = self.viewControllers?.first as! StoriesViewController
            let curIdx  = (_controllers as NSArray).indexOfObject(current)
            
            self.navigationTitle.text = self.titles[curIdx]
            self.pageIndicator.currentPage = curIdx
            
            self.navigationTitle.alpha = 0.0
            self.pageIndicator.alpha   = 0.0
            UIView.animateWithDuration(0.5, animations: {
                self.navigationTitle.alpha = 1.0
                self.pageIndicator.alpha   = 1.0
                }, completion: nil)
        }
    }
}
// MARK: private

