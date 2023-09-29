//
//  AuthManager.swift
//  Spotify
//
//  Created by Alexander Nitiola on 06/09/2023.
//

import Foundation

struct Constants {
    static let clientID = ""
    static let clientSecret = ""
}

final class AuthManager {
    static let shared = AuthManager();
    
    private init() {}
    
    var isSignedIn: Bool {
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
