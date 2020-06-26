//
//  ContentView.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//
import Foundation
import SwiftUI
import UIKit
struct ContentView : View {
    @ObservedObject var userViewModel: UsersViewModel
    init() {
        userViewModel = UsersViewModel()
        UINavigationBar.appearance().barTintColor = .white
    }
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.none)
                ForEach(userViewModel.users.sorted(by: { $0.userName > $1.userName })) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        UserRow(user: user)
                    }.isDetailLink(false)
                }
            }.navigationBarTitle("Contacts", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                }, label: {
                    Text("Groups").foregroundColor(ColorPalette.primaryColor)
                }), trailing: Button(action: {
                }, label: {
                    Text("+").foregroundColor(ColorPalette.primaryColor).font(.headline)
                }))
        }.accentColor(ColorPalette.primaryColor)
    }
}
struct UserRow: View {
    let user: User
    var body: some View {
        HStack {
            ImageWidget(url: user.profilePic)
            VStack (alignment: .leading) {
                Text(user.userName).font(.headline)
            }.padding(.init(top: 0, leading: 16, bottom: 0, trailing: 32))
            if user.favorite {
                Image(uiImage: UIImage(named: "home_favourite")!.withRenderingMode(.alwaysOriginal))
                    .resizable()
                    .padding(4)
                    .frame(width: 30, height: 30)
            }
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}
struct ImageWidget: View {
    @ObservedObject var imageLoader: ImageLoader
    var dimension: CGFloat = 40
    var borderWidth: CGFloat = 1
    init(url: String, dimension: CGFloat?=nil, borderWidth: CGFloat?=nil) {
        imageLoader = ImageLoader(imageUrl: url)
        if let width = borderWidth {
            self.borderWidth = width
        }
        if let length = dimension {
            self.dimension = length
        }
    }
    var body: some View {
        Image(uiImage: self.imageLoader.imageData.count > 0 ? UIImage(data: self.imageLoader.imageData)! : UIImage(named: "placeholder_photo")!)
            .resizable()
            .clipShape(Circle())
            .padding(4)
            .overlay(Circle().stroke(ColorPalette.imageBorderColor, lineWidth: borderWidth))
            .frame(width: self.dimension, height: self.dimension)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
