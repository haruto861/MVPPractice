//
//  CheckListViewController.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/19.
//

import UIKit

final class CheckListViewController: UIViewController {

    @IBOutlet private weak var checkListTableView: UITableView! {
        didSet {
            checkListTableView.delegate = self
            checkListTableView.dataSource = self
            checkListTableView.register(CheckListTableViewCell.nib(), forCellReuseIdentifier: CheckListTableViewCell.identifier)
        }
    }
}

extension CheckListViewController: UITableViewDelegate {
}

extension CheckListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checkListTableView.dequeueReusableCell(withIdentifier: CheckListTableViewCell.identifier, for: indexPath)
        return cell
    }
}
