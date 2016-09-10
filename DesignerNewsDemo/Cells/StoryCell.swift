//
//  StoryCell.swift
//  DesignerNewsDemo
//
//  Created by ZachZhang on 2016/9/10.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit
import SnapKit

class StoryCell: UITableViewCell {
    
    var titleLabel : UILabel!
    var authorLabel : UILabel!
    var avatarImageView : UIImageView!
    var storyImageView : UIImageView!
    var commentButton : UIButton?
    var replyButton : UIButton?
    var upvoteButton : UIButton!
    var timeLabel : UILabel!
    var commentTextView : UITextView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        avatarImageView = UIImageView()
        avatarImageView.contentMode = .ScaleAspectFill
        contentView.addSubview(avatarImageView)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(18.0)
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        storyImageView = UIImageView()
        storyImageView.contentMode = .ScaleAspectFill
        contentView.addSubview(storyImageView)
        
        authorLabel = UILabel()
        authorLabel.textColor = UIColor.lightGrayColor()
        authorLabel.font = UIFont.systemFontOfSize(13.0)
        contentView.addSubview(authorLabel)
        
        timeLabel = UILabel()
        timeLabel.textColor = UIColor.lightGrayColor()
        timeLabel.font = UIFont.systemFontOfSize(15.0)
        contentView.addSubview(timeLabel)
        
        upvoteButton = UIButton(type: .Custom)
        upvoteButton.setImage(UIImage(named: "upvote-btn-normal"), forState: .Normal)
        upvoteButton.setTitle("123", forState: .Normal)
        upvoteButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        contentView.addSubview(upvoteButton)
        
        avatarImageView.snp_makeConstraints() { make in
            make.size.equalTo(CGSizeMake(20, 20))
            make.left.equalTo(self.contentView).offset(8)
            make.top.equalTo(self.contentView).offset(8)
        }
        avatarImageView.layer.cornerRadius = 10.0
        
        titleLabel.snp_makeConstraints() { make in
            make.left.equalTo(self.avatarImageView.snp_right).offset(8)
            make.top.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.timeLabel).offset(-4)
        }
        
        storyImageView.snp_makeConstraints() {make in
            make.left.equalTo(self.titleLabel.snp_left)
            make.size.equalTo(CGSizeMake(10, 10))
            make.top.equalTo(self.titleLabel.snp_bottom).offset(4)
        }
        
        authorLabel.snp_makeConstraints() { make in
            make.left.equalTo(self.storyImageView.snp_right).offset(4)
            make.centerY.equalTo(self.storyImageView)
            make.right.equalTo(self.titleLabel.snp_right)
        }
        
        timeLabel.snp_makeConstraints() { make in
            make.right.equalTo(self.contentView.snp_right).offset(-8)
            make.top.equalTo(self.contentView).offset(8)
            make.size.equalTo(CGSizeMake(32, 21))
        }
        
        upvoteButton.snp_makeConstraints() { make in
            make.size.equalTo(CGSizeMake(70, 33))
            make.left.equalTo(self.titleLabel.snp_left)
            make.top.equalTo(self.authorLabel.snp_bottom).priorityLow()
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-4).priorityHigh()
        }
    }
    
}
