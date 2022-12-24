//
//  AppConfigurationProvider.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation

class AppConfigurationProvider {
    static func getApiKey() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
}
