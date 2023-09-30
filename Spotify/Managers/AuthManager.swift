//
//  AuthManager.swift
//  Spotify
//
//  Created by Alexander Nitiola on 06/09/2023.
//

import Foundation

struct Constants {
    static let client_id = Environment.client_id;
    static let client_secret = Environment.client_secret;
}

final class AuthManager {
    static let shared = AuthManager();
    
    private init() {}
    
    public var signInURL: URL? {
        let state = String.random(length: 16);
        let scope = "user-read-private user-read-email";
        let redirect_uri = "https://github.com/thecre8tor";
        
        let string = "https://accounts.spotify.com/authorize?" +
        "response_type = code" +
        "&client_id = \(Constants.client_id)" +
        "&scope = \(scope)" +
        "&redirect_uri = \(redirect_uri)" +
        "&state = \(state)"
     
        return URL(string: string);
    }
    
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
