//
//  DetailViewController.swift
//  DemoTest
//
//  Created by Reetika sharma on 10/01/22.
//

import UIKit
import WebKit
class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    var url:String = ""
    
      override func viewDidLoad() {
        super.viewDidLoad()
       loadWebView(url: url)
    }
    
    func loadWebView(url:String) {
        let url = NSURL(string:url)
            let request = NSURLRequest(url: url! as URL)

            // init and load request in webview.
            webView = WKWebView(frame: self.view.frame)
            webView.navigationDelegate = self
            webView.load(request as URLRequest)
            self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
    }
    
    //MARK:- WKNavigationDelegate

    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
    print(error.localizedDescription)
    }


    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    print("Strat to load")
        }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("finish to load")
    }
}

