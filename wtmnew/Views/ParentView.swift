//
//  ParentView.swift
//  wtmapp
//
//  Created by Ananya Garg on 6/24/22.
//

import SwiftUI
import Firebase

struct ParentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage{
        case .signUpPage:
            SignUpView()
        case .signInPage:
            SignInView()
        case .mapPage:
            MapView()
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView().environmentObject(ViewRouter())
    }
}
