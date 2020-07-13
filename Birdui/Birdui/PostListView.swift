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
            PostView(postHandler: self.postVM, post: post)
          }
        }
        .navigationBarTitle(Text("Home"), displayMode: .inline)
        .navigationBarItems(
          leading: Image("mascot_swift-badge")
            .resizable()
            .frame(width: 50, height: 50)
            .padding(.bottom,5)
        )
        
        AddButtonView(showNewPost: $showNewPost)
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
