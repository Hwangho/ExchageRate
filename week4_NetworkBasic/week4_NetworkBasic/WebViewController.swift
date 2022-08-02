//
//  WebViewController.swift
//  week4_NetworkBasic
//
//  Created by 송황호 on 2022/07/28.
//

import UIKit

import WebKit


// Skeleton View pod 사용!!

class WebViewController: UIViewController {
    
    static let identifier = "WebViewController"
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var webView: WKWebView!
    
    var detinationURL: String = "me.go.kr/home/web/main.do"  // App Transport Scurity Settings
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        toolBar()
        openWebPage(url: detinationURL)
    }
    
    func toolBar() {
        self.navigationController?.isToolbarHidden = false
        
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(tapCancel))
        
        let goBackButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(tapGoBack))
        
        let reloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(tapReload))
        
        let goForwardButton = UIBarButtonItem(image: UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(tapgoForward))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        var items = [UIBarButtonItem]()
        [cancelButton, flexibleSpace, goBackButton, flexibleSpace, reloadButton, flexibleSpace, goForwardButton, flexibleSpace].forEach {
            items.append($0)
        }
        
        self.toolbarItems = items
    }
    
    @objc
    func tapCancel() {
        self.dismiss(animated: true)
    }
    
    @objc
    func tapGoBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc
    func tapReload() {
        webView.reload()
    }
    
    @objc
    func tapgoForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    func openWebPage(url: String) {
        let https = "https://"
        let url = url.lowercased().contains(https) ? url : "https://\(url)"
        
        guard let url = URL(string: "\(url)") else { print("Invalid URL"); return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }

}


extension WebViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}
