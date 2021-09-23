//
//  Router.swift
//  Task14
//
//  Created by 松島悠人 on 2021/09/22.
//

import Foundation
import UIKit

class Router {

    static var shared: Router = .init()
    private init() {}
    private var window: UIWindow?

    func showRoot(window: UIWindow) {
        let viewController  = UIStoryboard.fruitsListViewContrtoller
        let presenter = FruitsListPresenter(output: viewController)
        viewController.inject(presenter: presenter)
        let nav  = UINavigationController(rootViewController: viewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }

    func toAddFrutitsVC(from: UIViewController) {
        let viewController = UIStoryboard.addFruitsViewController
        viewController.addFruitsDelegate = from as? AddFruitsDelegate
        let presenter = AddFruitsPresenter(output: viewController)
        viewController.inject(presenter: presenter)
        let nav = UINavigationController(rootViewController: viewController)
        transit(from: from, next: nav)
    }

    func transit(from: UIViewController, next: UIViewController, animted: Bool = true) {
        from.present(next, animated: true, completion: nil)
    }
}
