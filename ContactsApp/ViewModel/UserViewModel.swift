//
//  UserViewModel.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import Foundation
class UsersViewModel: ObservableObject {
    @Published var users: [User] = [
        .init(userId: 123, firstname: "Donald", lastName: "Trump", profilePic: "placeholder_photo", favorite: false),
        .init(userId: 222, firstname: "Vladimir", lastName: "Putin", profilePic: "placeholder_photo", favorite: false),
    ]
    init() {
        // Fetch json and decode and update some array property
        guard let url = URL(string: EndPoints.GET_CONTACTS) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let err = error {
                debugPrint("Error in Fetching GET_CONTACTS Data", err)
                return
            }
            guard let responseData = data else { return }
            DispatchQueue.main.async {
                do {
                    self.users = try JSONDecoder().decode([User].self, from: responseData)
                    debugPrint("Repsonse Success", responseData)
                }
                catch {
                    debugPrint("Failed To Decode Contacts Repsonse", error)
                }
            }
        }.resume()
    }
}
class ImageLoader: ObservableObject {
    @Published var imageData = Data()
    init(imageUrl: String) {
        guard let url = URL(string: EndPoints.BASE_URL + imageUrl) else {
            print("image data")
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, resp, error)  in 
            if let err = error {
                debugPrint("Error in Fetching GET_CONTACTS Data", err)
                return
            }
            guard let loadData = data else { return }
            DispatchQueue.main.async {
                self.imageData = loadData
            }
        }.resume()
    }
    
}
class DetailViewModel: ObservableObject {
    @Published var detailData: Detail = Detail(userId: 0000000, firstname: "", lastName: "", profilePic: "placeholder_photo", email: "", phoneNumber: "", favorite: false)
    func fetchDetail(userId: Int) {
        // fetch json and decode and update some array property
        guard let url = URL(string: EndPoints.returnContactDetailUrl(id: userId)) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let err = error {
                debugPrint("Error in Fetching GET_CONTACTS_DETAIL Data", err)
                return
            }
            guard let responseData = data else { return }
            DispatchQueue.main.async {
                do {
                    self.detailData = try JSONDecoder().decode(Detail.self, from: responseData)
                    debugPrint("Repsonse Success", self.detailData)
                }
                catch {
                    debugPrint("Failed To Decode Contacts Repsonse", error)
                }
            }
        }.resume()
    }
    func deleteContact(userId: Int) {
        var firstTodoUrlRequest = URLRequest(url: URL(string: EndPoints.returnContactDetailUrl(id: userId))!)
        firstTodoUrlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
              print("error calling DELETE on /todos/1")
              return
            }
            print("DELETE ok")
        }.resume()
    }
}
