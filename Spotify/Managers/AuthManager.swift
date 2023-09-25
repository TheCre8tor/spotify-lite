//
//  AuthManager.swift
//  Spotify
//
//  Created by Alexander Nitiola on 06/09/2023.
//

import Foundation

struct Constants {
    static let clientID = ProcessInfo.processInfo.environment["CLIENT_ID"]
    static let clientSecret = ProcessInfo.processInfo.environment["CLIENT_SECRET"]
}

final class AuthManager {
    static let shared = AuthManager();
    
    private init() {}
    
    var isSignedIn: Bool {
        if let userID = ProcessInfo.processInfo.environment["CLIENT_SECRET"] {
           print("UserID: \(userID)")
        }
        
        return false;
    }
    
    private var accessToken: String? {
        return Optional.none;
    }
    
    private var refreshToken: String? {
        return Optional.none;
    }
    
    private var tokenExpirationDate: Optional<Date> {
        return Optional.none;
    }
    
    private var shouldRefreshToken: Optional<Bool> {
        return false;
    }
}
