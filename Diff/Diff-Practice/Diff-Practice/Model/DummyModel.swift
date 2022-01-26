//
//  DummyModel.swift
//  Diff-Practice
//
//  Created by Zoe on 2022/01/26.
//

import Foundation

struct DummyModel: Equatable {
    
    static func ==(lhs: DummyModel, rhs: DummyModel) -> Bool {
        
        var result: Bool = false
        
        if lhs.message == rhs.message,
           lhs.reaction == rhs.reaction,
           lhs.files == rhs.files,
           lhs.comments == rhs.comments {
            result = true
        }
        
        return result
    }
    
    let message: String
    let reaction: [String]
    let files: [String]
    let comments: [String]
}
