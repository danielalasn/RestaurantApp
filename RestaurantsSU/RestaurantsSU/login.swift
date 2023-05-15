//
//  login.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 14/5/23.
//

import Foundation
import SwiftUI
import Firebase

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""

        var body: some View {
            VStack {
                if userIsLoggedIn {
                    RestaurantList(userIsLoggedIn: $userIsLoggedIn)
                } else {
                    content
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(""), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        
    var content: some View{
        ZStack{
        Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
        VStack{
            HStack{
                VStack{
                    Text("Bienvenido!")
                        .foregroundColor(.black)
                        .font(.system(size:40, weight: .bold, design: .rounded))
                    Text("Restaurantes Merida")
                        .foregroundColor(.black)
                        .font(.system(size:30, design: .rounded))
                }
            }.padding(20)
            HStack{
                VStack{
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .font(.system(size:20, design: .rounded))
                        .padding()
                        .placeholder(when: email.isEmpty){
                            Text("Email")
                                .foregroundColor(.gray)
                                .bold()
                                .font(.system(size:30, design: .rounded))
                                .padding()
                        }
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(20)
                        .autocapitalization(.none)
                    
                    TextField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .padding()
                        .font(.system(size:20, design: .rounded))
                        .placeholder(when: password.isEmpty){
                            Text("Password")
                                .foregroundColor(.gray)
                                .bold()
                                .font(.system(size:30, design: .rounded))
                                .padding()
                        }
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(20)
                        .autocapitalization(.none)
                }
            }.padding(20)
            HStack{
                VStack{
                    Button {
                        register()
                    } label: {
                        Text("Registrate")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(Color.blue.opacity(0.75))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    
                    Button{
                        login()
                    }label: {
                        Text("Log in")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(Color.blue.opacity(0.75))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                }
            }.padding(20)
                .offset(y:-25)
            
            HStack {
                Text("Hecha por Daniel Alas")
                    .foregroundColor(.white)
                    .font(.system(size:20, design: .rounded))
                    .offset(y:30)
            }.padding(20)
        }
        .frame(width: 350)
        .onAppear {
            if UserDefaults.standard.bool(forKey: "UserIsLoggedIn") {
                userIsLoggedIn = true
            }
        }
    }
}
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                let errorMessage = error.localizedDescription
                print(errorMessage)
                showAlert(message: errorMessage)
            } else {
                let message = "\(email) ha sido registrado exitosamente"
                showAlert(message: message)
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                let errorMessage = error.localizedDescription
                print(errorMessage)
                showAlert(message: errorMessage)
            } else {
                UserDefaults.standard.set(true, forKey: "UserIsLoggedIn")
                userIsLoggedIn = true
            }
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
    
}

struct Login_Previews: PreviewProvider{
    static var previews : some View {
        Login()
    }
}



extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
