//
//  WebViewController.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 11.11.2021.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: URL?
    var webView: WKWebView = {
        let control = WKWebView()
        return control
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinRight(to: view)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        webView.pinLeft(to: view)
        webView.load(URLRequest(url: (url ?? URL(string:"https://skillbox.ru/media/code/chto_takoe_mvc_bazovye_kontseptsii_i_primer_prilozheniya/"))!))
        
    }
}
