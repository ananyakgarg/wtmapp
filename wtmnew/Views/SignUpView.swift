//
//  SignUpView.swift
//  wtmapp
//
//  Created by Ananya Garg on 6/24/22.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signUpProcessing = false
    
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack(spacing: 15){
            SignUpHeader()
            Spacer()
            SignUpFields(email: $email, password: $password, passwordConfirmation: $passwordConfirm)
            Button(action: {
                signUpUser(userEmail: email, userPassword: password)
            })
            {
                Text("Sign Up")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm ? false: true)
            Spacer()
            HStack {
                Text("Already have an account?")
                Button(action: {
                    viewRouter.currentPage = .signInPage
                }) {
                    Text("Log In")
                }
            }
            
        }
        .padding()
        
    }
    
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
    
    func signUpUser(userEmail: String, userPassword: String){
        signUpProcessing = true
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {authResult,
            error in
            guard error == nil else{
                signUpProcessing = false
                return
            }
                switch authResult{
                case .none:
                    print("Could not create account.")
                    signUpProcessing = false
                case .some(_):
                    print("User created")
                    signUpProcessing = false
                    viewRouter.currentPage = .mapPage
                
                
            }
        }
    }
}

struct SignUpHeader: View{
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View{
        HStack{
            Image(systemName: "x.square.fill")
            Spacer().frame(width: 50.0)
            Text("Sign Up")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .semibold))
                .padding()
            Spacer().frame(width: 50.0)
            Button(action:
                    {
                viewRouter.currentPage = .signInPage
            })
            {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding()
                
            }
            
            
        }
        
    }
}
struct SignUpFields: View{
    
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
        
    var body: some View{
        Group{
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            SecureField("Re-enter password", text: $passwordConfirmation)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
        }
    }
    
}




