//
//  StoriesViewController.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 16/9/8.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

private let kStoryCellID = "StoryCell"

class StoriesViewController: UIViewController {
    
    private var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.registerClass(StoryCell.self, forCellReuseIdentifier: kStoryCellID)
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension StoriesViewController : UITableViewDelegate {
    
}

extension StoriesViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kStoryCellID) as! StoryCell
        cell.avatarImageView.backgroundColor = UIColor.blueColor()
        cell.storyImageView.backgroundColor = UIColor.yellowColor()
        cell.titleLabel.text = "This is a Test Cell"
        cell.timeLabel.text = "21h"
        cell.authorLabel.text = "Zach Zhang"
        cell.upvoteButton .setTitle("233", forState: .Normal)
        
        return cell
    }
}
