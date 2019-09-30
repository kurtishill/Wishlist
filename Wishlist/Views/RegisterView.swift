//
//  RegisterView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/27/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

fileprivate let sidePadding: CGFloat = 20
fileprivate let componentSize: CGFloat = 50
fileprivate let spacePadding: CGFloat = 30

struct RegisterView: View {
    var registerVM: RegisterViewModel = RegisterViewModel(
        logInService: LogInService(logInNetwork: MockLogIn()),
        signUpService: SignUpService()
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Circles()
                
                PageContent(registerVM: self.registerVM)
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [AssetColors.primaryColor, AssetColors.lightPrimaryColor.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PageContent: View {
    @ObservedObject var registerVM: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            HStack {
                Image(systemName: "gift.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(AssetColors.accentColor)
                Text("Wishlist")
                    .foregroundColor(.black)
                    .font(.custom("Montserrat-Medium", size: 40))
            }.padding(.leading, 20)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: nil, height:
                    sidePadding +
                        (componentSize * 3) +
                        (spacePadding * 2) +
                    sidePadding)
                .padding(.all, 20)
                .foregroundColor(.white)
                .shadow(radius: 14)
                .overlay(
                    VStack {
                        FormView(registerVM: self.registerVM)
                            .padding(.init(top: sidePadding * 2, leading: sidePadding * 2, bottom: 0, trailing: sidePadding * 2)
                        )
                        Spacer()
                    }
            )
            
            NavigationLink(destination: HomeView(), tag: 1, selection: self.$registerVM.isSignedUp) {
                Button(action: {
                    self.registerVM.signUp()
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: nil, height: componentSize)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                        .overlay(Text("Sign up")
                            .foregroundColor(AssetColors.accentColor)
                            .font(.custom("Montserrat-Medium", size: 20))
                    ).padding(.leading, 20)
                        .padding(.trailing, 20)
                }
            }
            
            Spacer()
            
        }
    }
}

struct FormView: View {
    @ObservedObject var registerVM: RegisterViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacePadding) {
            Group {
                
                TextField("Username", text: self.$username)
                    .frame(width: nil, height: componentSize)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.custom("Montserrat-Medium", size: 15))
                    .foregroundColor(.black)
                
                SecureField("Password", text: self.$password)
                    .frame(width: nil, height: componentSize)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.custom("Montserrat-Medium", size: 15))
                    .foregroundColor(.black)
                
                NavigationLink(destination: HomeView(), tag: 1, selection: self.$registerVM.isLoggedIn) {
                    Button(action: {
                        if !self.registerVM.isLoggingIn {
                            self.registerVM.signIn(username: self.username, password: self.password)
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: nil, height: componentSize)
                            .foregroundColor(AssetColors.accentColor)
                            .shadow(radius: 4)
                            .overlay(
                                HStack(alignment: .center, spacing: 20) {
                                    if self.registerVM.isLoggingIn {
                                        LoadingIndicator()
                                    }
                                    
                                    Text("Log in")
                                        .foregroundColor(.white)
                                        .font(.custom("Montserrat-Medium", size: 20))
                                        .animation(.spring())
                                }
                        )
                    }
                }
            }
        }
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
