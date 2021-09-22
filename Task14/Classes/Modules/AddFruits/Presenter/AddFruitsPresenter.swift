//
//  AddFruitsPresenter.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/22.
//

import Foundation

// 入力
protocol AddFruitsPresenterInput {
    func textFieldInput(text: String?)
    func cancelButton()
}
// 出力
protocol AddFruitsPresenterOutput {
    func cancelButton(isTap: Bool)
    func saveButton(isTap: Bool)
    func addFruit(fruit: String)
}

class AddFruitsPresenter {
    private var output: AddFruitsPresenterOutput!
    init(output: AddFruitsPresenterOutput) {
        self.output = output
    }
}

extension AddFruitsPresenter: AddFruitsPresenterInput {
    func cancelButton() {
        output.cancelButton(isTap: true)
    }

    func textFieldInput(text: String?) {
        if let fruitName = text {
            output.addFruit(fruit: fruitName)
            output.saveButton(isTap: true)
        }
    }
}
