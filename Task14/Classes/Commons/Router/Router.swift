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
        let vc  = UIStoryboard.fruitsListViewContrtoller
        let presenter = FruitsListPresenter(output: vc)
        vc.inject(presenter: presenter)
        let nav  = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }

    func toAddFrutitsVC(from: UIViewController) {
        let vc  = UIStoryboard.addFruitsViewController
        vc.addFruitsDelegate = from as? AddFruitsDelegate
        let presenter = AddFruitsPresenter(output: vc)
        vc.inject(presenter: presenter)
        let nav  = UINavigationController(rootViewController: vc)
        transit(from: from, next: nav)
    }

    func transit(from: UIViewController, next: UIViewController, animted: Bool = true) {
            from.present(next, animated: true, completion: nil)
    }
}
