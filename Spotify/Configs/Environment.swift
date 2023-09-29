//
//  Environment.swift
//  Spotify
//
//  Created by Alexander Nitiola on 29/09/2023.
//

import Foundation

public enum Environment {
    enum Keys {
        static let client_id = "CLIENT_ID";
        static let client_secret = "CLIENT_SECRET";
    }
    
    /// Getting plist here
    private static let info_dictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        
        return dict;
    }()
    
    static let client_id: String = {
        guard let baseURLString = Environment.info_dictionary[Keys.client_id] as? String else {
            fatalError("Client ID not set in plist");
        }
        
        return baseURLString;
    }()
    
    static let client_secret: String = {
        guard let client_secret = Environment.info_dictionary[Keys.client_secret] as? String else {
            fatalError("Client Secret not set in plist")
        }
        
        return client_secret;
    }()
}
