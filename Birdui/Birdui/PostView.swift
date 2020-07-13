//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  let postHandler : PostViewModel
  let post: MediaPost
  
  @State var editedText = ""
  @State var showingActionSheet = false
  @State var showEditView = false
  
  var body: some View {

    VStack{
      HStack {
        Image("mascot_swift-badge")
          .resizable()
          .frame(width: 50, height: 50)
        VStack(alignment: .leading) {
          Text("\(post.userName)")
          Text("\(post.getFormatedDate())")
        }
        Spacer()
        Image(systemName: "ellipsis")
          .font(.system(size: 22))
          .foregroundColor(.gray)
          .onTapGesture {
            self.showingActionSheet = true
        }
      }
      
      HStack {
        Text("\(post.textBody ?? "")")
        Spacer()
      }
      if post.uiImage != nil {
        Image(uiImage: post.uiImage!)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 150, height: 150, alignment: .center)
      }
    }
      //action sheet for Delete or Edit post
    .actionSheet(isPresented: $showingActionSheet) {
      ActionSheet(title: Text("Choose Option"), message: Text("Edit or Delete"), buttons: [
        //Edit post
        .default(Text("Edit Post"), action: {
          self.showEditView = true
        }),
        //Delete post
        .destructive(Text("Delete Post"), action: {
          self.postHandler.removePost(post: self.post)
        }),
        .cancel()
      ])
      //End of action sheet
    }
    .sheet(isPresented: $showEditView) {
      // TODO: Show ImagePicker
      PostEditView(postHandler: self.postHandler, post: self.post, textBody: self.post.textBody ?? "")
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(postHandler: PostViewModel(), post: MediaPost(textBody: "Went to the Aquarium today :]",
                             userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus")))
  }
}
