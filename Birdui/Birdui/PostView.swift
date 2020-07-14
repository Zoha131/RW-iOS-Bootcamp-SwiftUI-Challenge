//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  let post: MediaPost
  var postHandler: PostViewModel
  var onImageClick: ((MediaPost) -> Void)?
  
  @State var editedText = ""
  @State var showingActionSheet = false
  @State var showEditView = false
  
  var body: some View {
    
    HStack(alignment: .top){
      
      Image("mascot_swift-badge")
        .resizable()
        .frame(width: 50, height: 50)
      
      VStack(alignment: .leading) {
        
        
        //Top
        HStack(alignment: .top) {
          VStack(alignment:.leading) {
            Text("\(post.userName)")
              .fontWeight(.medium)
              .padding(.top, 5)
            
            Text("\(post.getFormatedDate())")
              .font(.system(size: 12))
              .padding(.bottom, 15)
          }
          Spacer()
          
          VStack(alignment: .trailing, spacing: 0) {
            Image(systemName: "ellipsis")
              .font(.system(size: 24))
              .foregroundColor(.gray)
              .padding(.top, 5)
              .onTapGesture {
                self.showingActionSheet = true
              }
            
            if showEditView {
              Text("edited")
                .font(.system(size: 14))
                .fontWeight(.thin)
                .italic()
            }
          }
          
        }.background(Color(UIColor.systemBackground))
        
        //Body
        HStack{
          Text("\(post.textBody)")
            .font(.system(size: 16))
            .fontWeight(.light)
        }
        
        if post.uiImage != nil {
          Button(action: {
            if let imageClick = self.onImageClick {
              imageClick(self.post)
            }
          }) {
            Image(uiImage: post.uiImage!)
              .resizable()
              .scaledToFill()
              .frame(height: 150)
              .background(Color.gray)
              .cornerRadius(10)
              .clipped()
          }
          .buttonStyle(PlainButtonStyle())
        }
        
        HStack{
          
          ReactionButton(
            reactionType: .like,
            reactionCount: self.post.reaction.likeCount,
            isReacted: self.post.reaction.userReactionType == ReactionType.like
          ) { reaction in
            self.postHandler.updateReaction(post: self.post, reaction: .like)
          }
          
          Spacer()
          
          ReactionButton(
            reactionType: .dislike,
            reactionCount: self.post.reaction.dislikeCount,
            isReacted: self.post.reaction.userReactionType == ReactionType.dislike
          ) { reaction in
            self.postHandler.updateReaction(post: self.post, reaction: .dislike)
          }
          
          Spacer()
          
          ReactionButton(
            reactionType: .love,
            reactionCount: self.post.reaction.loveCount,
            isReacted: self.post.reaction.userReactionType == ReactionType.love
          ) { reaction in
            self.postHandler.updateReaction(post: self.post, reaction: .love)
          }
          // Added this background to block Imageview to get
          // the tapgesture call. Without this background the image view
          // recieve the tap even if I tap inside the HStack
          // Used system color so that it will work in both
          // dark and light mode
        }.background(Color(UIColor.systemBackground))
      }
      

    } //action sheet for Delete or Edit post
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
      PostEditView(postHandler: self.postHandler, post: self.post, textBody: self.post.textBody)
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(
      textBody: "Went to the Aquarium today :]",
      userName: "Audrey",
      timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "ray")),
             postHandler: PostViewModel())
  }
}
