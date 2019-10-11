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

struct AuthView: View {
    var authVM: AuthViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Circles()
                
                PageContent(authVM: self.authVM)
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [AssetColors.primaryColor, AssetColors.lightPrimaryColor.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PageContent: View {
    @ObservedObject var authVM: AuthViewModel
    @State var birthdate: Date = Date()
    @State var datePickerShowing: Bool = false
    @State var birthdateString: String = ""
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Group {
                        Image(systemName: "gift.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(AssetColors.accentColor)
                        Text("Wishlist")
                            .foregroundColor(.black)
                            .font(.custom(AssetsFonts.primaryFont, size: 40))
                    }.animation(.spring())
                }.padding(.leading, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: nil, height:
                            sidePadding +
                                (componentSize * (self.authVM.state is LoginState ? 3 : 5)) +
                                (spacePadding * (self.authVM.state is LoginState ? 2 : 4)) +
                            sidePadding
                        )
                        .animation(.spring())
                        .padding(.all, 20)
                        .foregroundColor(.white)
                        .shadow(radius: 14)
                    
                    VStack {
                        AuthFormView(authVM: self.authVM,
                                     birthdate: self.$birthdate,
                                     birthdateString: self.$birthdateString,
                                     datePickerShowing: self.$datePickerShowing,
                                     spacePadding: spacePadding,
                                     componentSize: componentSize
                            ).padding(.all, sidePadding * 2)
                    }
                }
                
                HStack {
                    Spacer()
                    Text(self.authVM.state is LoginState ? "Don't have an account? " : "Already have an account? ")
                    Button(action: {
                        if !self.authVM.isAuthenticating {
                            self.authVM.toggleState()
                        }
                    }) {
                        Text(self.authVM.state is LoginState ? "Sign up" : "Log in")
                            .foregroundColor(AssetColors.darkPrimaryColor)
                            .bold()
                    }
                    Spacer()
                }.animation(.spring())
                
                Spacer()
                
            }
            
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .foregroundColor(.white)
                    DatePickerView(datePickerShowing: self.$datePickerShowing, birthdate: self.$birthdate, birthdateString: self.$birthdateString)
                }.offset(y: self.datePickerShowing ? 0 : 365)
                    .animation(.spring())
            }
        }
    }
}

struct DatePickerView: View {
    @Binding var datePickerShowing: Bool
    @Binding var birthdate: Date
    @Binding var birthdateString: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.datePickerShowing = false
                    self.birthdateString = dateFormatter.string(from: self.birthdate)
                }) {
                    Text("Done")
                        .font(.custom(AssetsFonts.primaryFont, size: 15))
                        .foregroundColor(.black)
                }
            }.padding(.trailing, 20)
            HStack {
                Spacer()
                DatePicker("", selection: self.$birthdate, displayedComponents: .date)
                Spacer()
            }
        }
    }
}

//struct AuthView_Preview: PreviewProvider {
//    static var previews: some View {
//        AuthView()
//    }
//}
