//
//  AddFruitsViewController.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/22.
//

import UIKit

protocol AddFruitsDelegate: AnyObject {
    func add(fruit: String)
}

final class AddFruitsViewController: UIViewController {

    private var fruitsList = FruitsList()
    weak var addFruitsDelegate: AddFruitsDelegate?

    @IBOutlet private weak var addNametextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNabBarItem()
    }

    private func prepareNabBarItem() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }

    @objc private func save() {
        if let name = addNametextField.text {
            addFruitsDelegate?.add(fruit: name)
            self.dismiss(animated: true, completion: nil)
        }
    }

    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
