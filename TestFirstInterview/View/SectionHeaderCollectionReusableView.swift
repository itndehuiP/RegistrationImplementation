//
//  SectionHeaderCollectionReusableView.swift
//  TestFirstInterview
//
//  Created by Guerson on 6/1/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitleLabel : UILabel!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.gray
        sectionTitleLabel.textColor = UIColor.white
    }
}
