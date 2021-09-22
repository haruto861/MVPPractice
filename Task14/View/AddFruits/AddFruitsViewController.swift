//
//  AddFruitsViewController.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/22.
//

import UIKit

class AddFruitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNabBarItem()
    }

    private func prepareNabBarItem() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: "")
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: "")
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }

    @objc private func save() {

    }

    @objc private func cancel() {

    }
}
