//
//  FruitsListPresenter.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/21.
//

import Foundation
// 外部からの入力
protocol FruitsListPresenerInput {
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    func append(fruit: String)
    func fruit(index: Int) -> Fruit
    func transit()
}
// 外部への出力
protocol FruitsListPresenterOutput {
    func transit()
}

class FruitsListPresenter {
    private var fruitsList = FruitsList()
    private var output: FruitsListPresenterOutput!
    init(output: FruitsListPresenterOutput) {
        self.output = output
    }
}

extension FruitsListPresenter: FruitsListPresenerInput {
    func append(fruit: String) {
        fruitsList.fruits.append(Fruit(name: fruit, isChecked: false))
    }
    var heightForRow: Int { 70 }
    var numberOfRows: Int { fruitsList.fruits.count }
    func fruit(index: Int) -> Fruit { fruitsList.fruits[index] }
    func transit() { output.transit() }
}
