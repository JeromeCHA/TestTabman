//
//  TestWebViewController.swift
//  TestTabman
//
//  Created by ジェローム　チャ on 2017/12/04.
//  Copyright © 2017 ジェローム　チャ. All rights reserved.
//

import UIKit

class TestWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webview = UIWebView(frame: self.view.frame)
        self.view.addSubview(webview)
        if let url = URL(string: "https://www.google.co.jp/") {
            webview.loadRequest(URLRequest(url: url))
        }
    }

}
