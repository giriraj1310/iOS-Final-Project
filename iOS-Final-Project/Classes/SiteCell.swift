//
//  SiteCell.swift
//
//  Created by Xcode User on 2019-03-07.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

//
//  Modify this to the app's need.
//  Note: This will be modified
//  depending on what we want to show
//  on the table.
//
class SiteCell: UITableViewCell {

    let primaryLabel = UILabel();
    let secondaryLabel = UILabel();
    let myimageView = UIImageView();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        primaryLabel.textAlignment = .left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 30)
        primaryLabel.backgroundColor = .clear
        primaryLabel.textColor = .green
        primaryLabel.layer.backgroundColor = UIColor.clear.cgColor
        
        secondaryLabel.textAlignment = .left
        secondaryLabel.font = UIFont.boldSystemFont(ofSize: 16)
        secondaryLabel.backgroundColor = .clear
        secondaryLabel.textColor = .blue
        secondaryLabel.layer.backgroundColor = UIColor.clear.cgColor
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(myimageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        primaryLabel.frame = CGRect(x: 100, y: 5, width: 460, height: 30)
        secondaryLabel.frame = CGRect(x: 100, y: 40, width: 460, height: 20)
        myimageView.frame = CGRect(x: 5, y: 5, width: 60, height: 60)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
