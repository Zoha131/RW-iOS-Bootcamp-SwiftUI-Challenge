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
  
  @State var showNewPost = false
  
  var body: some View {
    // TODO: This should look exactly like the Birdie table view,
    // but with only one button.
    
    
    NavigationView {
      
      ZStack(alignment: .leading){
        
        // List View starts here
        List {
          ForEach(postVM.posts) { post in
            PostView(post: post)
          }
        }
        .navigationBarTitle(Text("Home"), displayMode: .inline)
        .navigationBarItems(
          leading: Image("mascot_swift-badge")
            .resizable()
            .frame(width: 50, height: 50)
            .padding(.bottom,5)
        )
        
        // Button to add new post
//        Button(
//          action: { self.showNewPost = true },
//          label: { Text("Add New Post") }
//        ).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        AddButtonView()
      }
    }
    .sheet(isPresented: $showNewPost) {
      NewPostView(postHandler: self.postVM)
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
