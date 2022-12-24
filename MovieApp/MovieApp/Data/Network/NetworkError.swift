//
//  NetworkError.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import Moya

public struct NetworkError: Error {
    private let errorTitle: String
    private let baseError: Error
    
    init(errorTitle: String, baseError: Error) {
        self.errorTitle = errorTitle
        self.baseError = baseError
    }
    
    func getLocalizedDescription() -> String {
        return self.baseError.localizedDescription
    }
    
    func getErrorTitle() -> String {
        return self.errorTitle
    }
}
