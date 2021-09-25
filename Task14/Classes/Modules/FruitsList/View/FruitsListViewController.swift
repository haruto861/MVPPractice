//
//  CheckListViewController.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/19.
//

import UIKit

final class FruitsListViewController: UIViewController {

    private var presenter: FruitsListPresenerInput!
    func inject(presenter: FruitsListPresenerInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavBarItem()
    }

    @IBOutlet private weak var fruitsListTableView: UITableView! {
        didSet {
            fruitsListTableView.delegate = self
            fruitsListTableView.dataSource = self
            fruitsListTableView.register(
                FruitsListTableViewCell.nib(),
                forCellReuseIdentifier: FruitsListTableViewCell.identifier
            )
        }
    }

    private func prepareNavBarItem() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(transitToNextVC))
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc private func transitToNextVC() {
        presenter.transit()
    }
}

extension FruitsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(presenter.heightForRow)
    }
}

extension FruitsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fruitsListTableView.dequeueReusableCell(
            withIdentifier: FruitsListTableViewCell.identifier,
            for: indexPath
        ) as! FruitsListTableViewCell // swiftlint:disable:this force_cast

        cell.configure(fruit: presenter.fruit(index: indexPath.row))
        return cell
    }
}

extension FruitsListViewController: FruitsListPresenterOutput {
    func transit() {
        Router.shared.toAddFrutitsVC(from: self)
    }
}

extension FruitsListViewController: AddFruitsDelegate {
    func add(fruit: String) {
        presenter.append(fruit: fruit)
        self.fruitsListTableView.reloadData()
    }
}
