//
//  CheckListTableViewCell.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/19.
//

import UIKit

class FruitsListTableViewCell: UITableViewCell {

    @IBOutlet private weak var checkImage: UIImageView!
    @IBOutlet private weak var fruitsNameLabel: UILabel!

    static var className: String {
        return String(describing: self)
    }

    static var identifier: String {
        return className
    }

    static var nibName: String {
        return className
    }

    static func nib() -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    func configure(fruitsName: String, checkImageUrl: String) {
        
    }
}
