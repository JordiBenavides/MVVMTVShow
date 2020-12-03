//
//  TVShowAPI.swift
//  MVVMTVShow
//
//  Created by Jordi Milla on 03/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum TVShowAPI {
    case getMovies
}

extension TVShowAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://api.tvmaze.com/")!}
    
    public var path: String {
        switch self {
        case .getMovies:
            return "shows"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
            
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getMovies:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getMovies:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
