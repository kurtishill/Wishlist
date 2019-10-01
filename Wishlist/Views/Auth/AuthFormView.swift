//
//  AuthFormView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "MM/dd/yyyy"
    return df
}()

struct AuthFormView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State var name: String = ""
    @Binding var birthdate: Date
    @Binding var birthdateString: String
    @Binding var datePickerShowing: Bool
    
    var spacePadding: CGFloat
    var componentSize: CGFloat
    
    var body: some View {
        VStack(spacing: spacePadding) {
            Group {
                TextField("username", text: self.$username)
                    .frame(height: componentSize)
                    .padding(.leading, 10)
                    .background(self.authVM.usernameHasError ? AssetColors.warningColor : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.custom(AssetsFonts.primaryFont, size: 15))
                    .foregroundColor(.black)
                
                SecureField("password", text: self.$password)
                    .frame(height: componentSize)
                    .padding(.leading, 10)
                    .background(self.authVM.passwordHasError ? AssetColors.warningColor : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.custom(AssetsFonts.primaryFont, size: 15))
                    .foregroundColor(.black)
                
                if self.authVM.state is SignUpState {
                    TextField("name", text: self.$name)
                        .frame(height: componentSize)
                        .padding(.leading, 10)
                        .background(self.authVM.nameHasError ? AssetColors.warningColor : Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .font(.custom(AssetsFonts.primaryFont, size: 15))
                        .foregroundColor(.black)
                    
                    Button(action: {
                        self.datePickerShowing = true
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: componentSize)
                            .foregroundColor(self.authVM.birthdateHasError ? AssetColors.warningColor : Color.gray.opacity(0.2))
                            .overlay(
                                HStack {
                                    Text(self.birthdateString == "" ? "date of birth" : self.birthdateString)
                                        .foregroundColor(self.birthdateString == "" ? Color.gray.opacity(0.5) : .black)
                                        .font(.custom(AssetsFonts.primaryFont, size: 15))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                        )
                    }
                }
            }.animation(.spring())
            
            ZStack {
                AuthenticateButton(authVM: self.authVM,
                                   username: self.$username,
                                   password: self.$password,
                                   name: self.$name,
                                   birthdateString: self.$birthdateString,
                                   componentSize: self.componentSize
                ).animation(.spring())
                
                HStack(alignment: .center, spacing: 20) {
                    if self.authVM.isAuthenticating {
                        LoadingIndicator()
                    }
                    
                    Text(self.authVM.state is LoginState ? "Log in" : "Sign up")
                        .foregroundColor(self.authVM.state is LoginState ? .white : AssetColors.accentColor)
                        .font(.custom(AssetsFonts.primaryFont, size: 20))
                        .animation(.spring())
                        .contentShape(NoHitShape())
                }
            }
        }
    }
}

struct AuthenticateButton: View {
    @ObservedObject var authVM: AuthViewModel
    @Binding var username: String
    @Binding var password: String
    @Binding var name: String
    @Binding var birthdateString: String
    
    let componentSize: CGFloat
    
    var body: some View {
        NavigationLink(destination: HomeView(), tag: 1, selection: self.$authVM.isAuthenticated) {
            Button(action: {
                if !self.authVM.isAuthenticating {
                    self.authVM.authenticate(
                        data: [
                            "username": self.username,
                            "password": self.password,
                            "name": self.name,
                            "birthdate": self.birthdateString
                        ]
                    )
                }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: componentSize)
                    .foregroundColor(self.authVM.state is LoginState ? AssetColors.accentColor : .white)
                    .shadow(radius: 4)
            }
        }
    }
}

struct NoHitShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path(CGRect(x: 0, y: 0, width: 0, height: 0))
    }
}

//struct AuthFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthFormView()
//    }
//}
