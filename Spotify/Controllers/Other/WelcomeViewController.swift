//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Alexander Nitiola on 25/08/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let signInButton: UIButton = {
        let button = UIButton();
        
        button.backgroundColor = .white;
        button.setTitle("Sign In with Spotify", for: UIControl.State.normal);
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal);
        
        return button;
    }()

    override func viewDidLoad() {
        super.viewDidLoad();
        title = "Spotify";
        view.backgroundColor = UIColor.systemGreen;
        view.addSubview(signInButton);
        
        signInButton.addTarget(
            self,
            action: #selector(didTapSignIn),
            for: UIControl.Event.touchUpInside
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        // This is where we position the button to the screen
        signInButton.frame = CGRect(
            x: 20,
            y: (view.height - 50) - view.safeAreaInsets.bottom,
            width: view.width - 40,
            height: 50
        );
        
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController();
        
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never;
        
        // We are pushing the AuthViewController to the screen right here
        navigationController?.pushViewController(vc, animated: true);
    }
    
    private func handleSignIn(success: Bool) {
        // Log user in or yell at them for error
        
    }
}
