//
//  ViewRouter.swift
//  wtmnew
//
//  Created by Ananya Garg on 7/12/22.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .signUpPage
    
}

enum Page {
    case signUpPage
    case signInPage
    case mapPage
}

