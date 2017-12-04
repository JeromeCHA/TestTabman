//
//  ViewController.swift
//  TestTabman
//
//  Created by ジェローム　チャ on 2017/12/04.
//  Copyright © 2017 ジェローム　チャ. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController {

    var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initPageMenu()
        generatePages()
    }

    func initPageMenu() {
        // buttonBar style
        self.dataSource = self
        self.isInfiniteScrollEnabled = true
        self.automaticallyAdjustsChildScrollViewInsets = false
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            appearance.indicator.color = UIColor.purple
            appearance.indicator.lineWeight = .normal
            appearance.indicator.isProgressive = false

            appearance.interaction.isScrollEnabled = true

            appearance.layout.itemDistribution = .centered
            appearance.layout.extendBackgroundEdgeInsets = false
            appearance.layout.edgeInset = 0.0

            appearance.state.selectedColor = UIColor.black
            appearance.state.color = UIColor.gray

            appearance.style.background = .solid(color: UIColor.white)
            appearance.style.bottomSeparatorColor = UIColor.gray
        })
    }

    func generatePages() {
        for index in 0...10 {
            let testViewController = TestTableViewController()
            testViewController.title = "Test \(index)"
            self.pages.append(testViewController)
        }
        self.bar.items = pages.map {
            return Item(title: $0.title?.uppercased() ?? "")
        }
        self.reloadPages()
    }
}

extension ViewController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.pages.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.pages[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: 1)
    }
}

