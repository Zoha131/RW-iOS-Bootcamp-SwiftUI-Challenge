//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    @ObservedObject var postVM = PostViewModel()
    
    var body: some View {
        // TODO: This should look exactly like the Birdie table view,
        // but with only one button.
        NavigationView {
            List {
                ForEach(postVM.posts) { post in
                    PostView(post: post)
                }
            }
            .navigationBarTitle("Home")
            .navigationBarItems(leading:
                Button(action: {
                    self.postVM.addPost(post: MediaPost(textBody: "I am going to post the chop picture again!!!", userName: "Emilio", timestamp: Date(timeIntervalSinceNow: 0), uiImage: UIImage(named: "chop")))
                }, label: {
                    Text("Add New Post")
                })
            )
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
