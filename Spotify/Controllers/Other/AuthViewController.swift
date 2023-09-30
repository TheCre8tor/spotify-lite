//
//  AuthViewController.swift
//  Spotify
//
//  Created by Alexander Nitiola on 25/08/2023.
//

import UIKit;
import WebKit;

class AuthViewController: UIViewController, WKNavigationDelegate {
    /// This is an anornymous function
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences();
        prefs.allowsContentJavaScript = true;
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs;
        
        return WKWebView(frame: .zero, configuration: config);
    }()

    override func viewDidLoad() {
        super.viewDidLoad();
        
        title = "Sign In";
        view.backgroundColor = .systemBackground;
        webView.navigationDelegate = self;
        view.addSubview(webView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        webView.frame = view.bounds;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
