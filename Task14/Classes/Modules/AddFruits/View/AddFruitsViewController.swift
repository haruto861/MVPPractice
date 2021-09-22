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

    weak var addFruitsDelegate: AddFruitsDelegate?
    private var presenter: AddFruitsPresenterInput!
    func inject(presenter: AddFruitsPresenterInput) {
        self.presenter = presenter
    }

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
        presenter.textFieldInput(text: addNametextField.text)
    }

    @objc private func cancel() {
        presenter.cancelButton()
    }
}

extension AddFruitsViewController: AddFruitsPresenterOutput {
    func addFruit(fruit: String) {
        addFruitsDelegate?.add(fruit: fruit)
    }

    func saveButton(isTap: Bool) {
        self.dismiss(animated: isTap, completion: nil)
    }

    func cancelButton(isTap: Bool) {
        self.dismiss(animated: isTap, completion: nil)
    }
}
