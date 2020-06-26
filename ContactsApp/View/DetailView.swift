//
//  DetailView.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import SwiftUI
import Combine
struct DetailView: View {
    @ObservedObject var detailViewModel = DetailViewModel()
    let user: User
    init(user: User) {
        self.user = user
    }
    var body: some View {
        ScrollView {
            VStack {
                DetailTopView(detail: self.detailViewModel.detailData)
                DetailBottomView(phoneNumber: self.detailViewModel.detailData.phoneNumber ?? "", email: self.detailViewModel.detailData.email ?? "")
                Spacer(minLength: 1)
                Button(action: {
                    self.detailViewModel.deleteContact(userId: self.user.userId)
                }, label: {
                    Text("Delete").foregroundColor(Color.red)
                }).padding()
                    .background(#colorLiteral(red: 0.9763647914, green: 0.9765316844, blue: 0.9763541818, alpha: 1).color)
            }.background(#colorLiteral(red: 0.9763647914, green: 0.9765316844, blue: 0.9763541818, alpha: 1).color)
        }
        .navigationBarItems(trailing: Button(action: {
        }, label: {
            Text("Edit").foregroundColor(ColorPalette.primaryColor)
        }))
            .onAppear {
                self.detailViewModel.fetchDetail(userId: self.user.userId)
        }
    }
}
struct DetailTopView: View {
    let detail: Detail
    var favIcon: String {
        guard detail.favorite else {
            return "favourite_button"
        }
        return "favourite_button_selected"
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [ColorPalette.whiteColor, ColorPalette.gradientEndColor.opacity(0.277)]), startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer(minLength: 10)
                ImageWidget(url: detail.profilePic, dimension: 120, borderWidth: 3)
                Spacer(minLength: 2)
                Text(detail.userName).font(.title).foregroundColor(ColorPalette.primaryTextColor)
                Spacer(minLength: 5)
                HStack {
                    ButtonWithIcon(title: "message", icon: "message_button")
                    ButtonWithIcon(title: "call", icon: "call_button")
                    ButtonWithIcon(title: "email", icon: "email_button")
                    ButtonWithIcon(title: "favourite", icon: favIcon)
                }
                Spacer(minLength: 10)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
struct ButtonWithIcon: View {
    let title: String
    let icon: String
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Button(action: {
            }) {
                Image(uiImage: UIImage(named: icon)!.withRenderingMode(.alwaysOriginal))
                    .resizable()
                    .clipShape(Circle())
                    .padding(4)
                    .overlay(Circle().stroke(ColorPalette.imageBorderColor, lineWidth: 0))
                    .frame(width: 55, height: 55)
            }.padding(.init(top: 4, leading: 0, bottom: 4, trailing: 0))
            Text(title.lowercased()).foregroundColor(ColorPalette.primaryTextColor).font(.system(size: 14))
        }).padding(4)
    }
}

struct DetailBottomView: View {
    let phoneNumber: String
    let email: String
    var body: some View {
        VStack {
            LabelTextField(label: "mobile", value: phoneNumber)
            Divider().pa
            LabelTextField(label: "email", value: email)
            Divider()
        }.background(#colorLiteral(red: 0.9763647914, green: 0.9765316844, blue: 0.9763541818, alpha: 1).color)
    }
}
struct LabelTextField : View {
    var label: String
    @State var value: String
    @State var number = "Phone Number"
    @State var email = "Email"
    var body: some View {
        HStack(alignment: .center, spacing: 1, content: {
            Text(label).foregroundColor(ColorPalette.lightGrayColor).frame(width: 60, height: 0, alignment: .leading).font(.body)
            TextField("", text: $value)
                .padding(4).environment(\.isEnabled, false)
        }).padding(.all)
        //            .background(Color.white)
    }
}
