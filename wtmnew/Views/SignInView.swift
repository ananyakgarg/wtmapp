//
//  SignInView.swift
//  wtmapp
//
//  Created by Ananya Garg on 6/24/22.
//


import SwiftUI
import MapKit
import Firebase

struct SignInView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State  var username = ""
    @State private var password = ""
    @State var signInProcess = false
    @State var signInError = ""
    
    
    
    
    
    var body: some View {
        VStack{
            Spacer()
            signInFields(username: $username, password: $password)
            Button(action: {
                userIn(myUsername: username, myPwd: password)
                
            }){
                Text("Log in")
                    .bold()
            }
            .disabled(!signInProcess && !username.isEmpty && !password.isEmpty ? false : true)
            Spacer()
            HStack{
                Button(action: {
                    viewRouter.currentPage = .signUpPage
                }){
                    Text("Sign Up")
                }
            }
            
        }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
    
    func userIn(myUsername: String, myPwd: String){
        signInProcess = true
        Auth.auth().signIn(withEmail: username, password: password){
            authResult, error in
            guard error == nil else{
                signInProcess = false
                signInError = error!.localizedDescription
                return
            }
            switch authResult{
            case .none:
                print("We couldn't sign you in, try again.")
            case .some(_):
                print("Welcome to the party!")
                signInProcess = false
                viewRouter.currentPage = .mapPage
            }
        }
    }
}

            
struct signInFields: View{
    @Binding var username: String
    @Binding var password: String
    
    var body: some View{
        Group{
            TextField("Username", text: $username)
                .padding()
            // format this however
            SecureField("Password", text: $password)
                .padding()
            // format this however
        }
    }
}
        
        
    
    



    

