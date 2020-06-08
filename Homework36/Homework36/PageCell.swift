//
//  PageCell.swift
//  Homework36
//
//  Created by Kato on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    @IBOutlet weak var pageImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    public static let identifier = "PageCell"

    func bind(page: Page) {
        pageImageView.image = page.image
        headerLabel.text = page.title
        textLabel.text = page.text
    }
}
