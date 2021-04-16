//
//  WebViewController.swift
//  TableViewApp
//
//  Created by Sidarth V on 11/04/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let webView: WKWebView = {
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preference
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    private let url:URL
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    init(url: URL, title: String){
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.backgroundColor = .systemBackground
        webView.load(URLRequest(url: url))
        confifureButtons()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    private func confifureButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
    }
    
    @objc func didTapDone(){
        dismiss(animated: true, completion: nil)
    }

}
