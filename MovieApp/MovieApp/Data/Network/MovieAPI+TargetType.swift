//
//  MovieAPI+TargetType.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import Moya

extension MovieAPI: TargetType{
    var baseURL: URL {
        guard let url =  URL(string: ApiPath.baseUrlPath) else {
            fatalError("Base URL couldn't be configured.")
        }
        return url
    }

    var path: String {
        switch self {
        case .getMovie:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMovie:
            return .get
        }
    }

    var task: Moya.Task {
        let apiKey = AppConfigurationProvider.getApiKey()
        switch self {
        case .getMovie(let keyword, let page, let type):
            return .requestParameters(parameters: [
                "apikey": apiKey,
                "s": keyword,
                "page": page,
                "type": type
            ], encoding:   URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        switch self {
        default:
            return [
                Constants.HTTPHeaderFields.contentType.rawValue: Constants.ContentType.json.rawValue,
            ]
        }
    }


}
