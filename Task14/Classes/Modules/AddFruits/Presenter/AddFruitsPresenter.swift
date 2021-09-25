//
//  AddFruitsPresenter.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/22.
//

import Foundation

// 入力
protocol AddFruitsPresenterInput {
    func saveButton(name: String?)
    func cancelButton()
}
// 出力
protocol AddFruitsPresenterOutput {
    func addFruit(fruit: String)
    func dismiss()
}

class AddFruitsPresenter {
    private var output: AddFruitsPresenterOutput!
    init(output: AddFruitsPresenterOutput) {
        self.output = output
    }
}

extension AddFruitsPresenter: AddFruitsPresenterInput {
    func cancelButton() {
        output.dismiss()
    }

    func saveButton(name: String?) {
        if let name = name {
            output.addFruit(fruit: name)
            output.dismiss()
        }
    }
}
