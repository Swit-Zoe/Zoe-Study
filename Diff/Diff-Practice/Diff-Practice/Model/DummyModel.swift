//
//  DummyModel.swift
//  Diff-Practice
//
//  Created by Zoe on 2022/01/26.
//

import Foundation
import IGListDiffKit

class DummyModel: Equatable {
    public init( primaryKey: Int, message: String, reaction: [String], files: [String], comments: [String]) {
        self.primaryKey = primaryKey
        self.message = message
        self.reaction = reaction
        self.files = files
        self.comments = comments
    }
    
    static func ==(lhs: DummyModel, rhs: DummyModel) -> Bool {
        
        var result: Bool = false
        
        if lhs.message == rhs.message,
           lhs.comments == rhs.comments,
           lhs.files == rhs.files,
           lhs.comments == rhs.comments {
            result = true
        }
        
        return result
        // return lhs.num == rhs.num && lhs.name == rhs.name
    }
    let primaryKey: Int
    let message: String
    let reaction: [String]
    let files: [String]
    let comments: [String]
}

extension DummyModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return primaryKey as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? DummyModel {
            var result: Bool = false
            
            if  primaryKey == object.primaryKey,
                message == object.message,
               comments == object.comments,
               files == object.files,
               comments == object.comments {
                result = true
            }
        }
        return false
    }
    
    
}
