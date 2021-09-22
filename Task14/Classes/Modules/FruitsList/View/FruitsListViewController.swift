//
//  CheckListViewController.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/19.
//

import UIKit

final class FruitsListViewController: UIViewController {

    private var fruitsList = FruitsList() 

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNabBarItem()
    }

    @IBOutlet private weak var fruitsListTableView: UITableView! {
        didSet {
            fruitsListTableView.delegate = self
            fruitsListTableView.dataSource = self
            fruitsListTableView.register(FruitsListTableViewCell.nib(), forCellReuseIdentifier: FruitsListTableViewCell.identifier)
        }
    }

    private func prepareNabBarItem() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(transit))
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc private func transit() {
        Router.shared.toAddFrutitsVC(from: self)
    }
}

extension FruitsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension FruitsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsList.useCase.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fruitsListTableView.dequeueReusableCell(withIdentifier: FruitsListTableViewCell.identifier, for: indexPath) as! FruitsListTableViewCell
        cell.configure(fruits: fruitsList.useCase[indexPath.row])
        return cell
    }
}

extension FruitsListViewController: AddFruitsDelegate {
    func add(fruit: String) {
        fruitsList.useCase.append(Fruits(fruit: fruit, isChecked: false))
        self.fruitsListTableView.reloadData()
    }
}
