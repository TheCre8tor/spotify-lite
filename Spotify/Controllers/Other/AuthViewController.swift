//
//  AuthViewController.swift
//  Spotify
//
//  Created by Alexander Nitiola on 25/08/2023.
//

import UIKit;
import WebKit;

class AuthViewController: UIViewController, WKNavigationDelegate {
    /// This is an anonymous function
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences();
        prefs.allowsContentJavaScript = true;
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs;
        
        return WKWebView(frame: .zero, configuration: config);
    }()
    
    public var completionHandler: ((Bool) -> Void)?;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        title = "Sign In";
        view.backgroundColor = .systemBackground;
        webView.navigationDelegate = self;
        view.addSubview(webView)
        
        // Load up the Web View
        guard let url = AuthManager.shared.signInURL else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        webView.frame = view.bounds;
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        
        // Exchange the code for access token
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        
        print("Code: \(code)")
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
