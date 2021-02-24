//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Raj Tailor on 2/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let test: String
    let answer: String
    
    init(q: String, a: String) {
        self.test = q
        self.answer = a
    }
    
}
