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
  @State var showingActionSheet = false
  
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
    .actionSheet(isPresented: $showingActionSheet) {
      ActionSheet(title: Text("Choose Option"), message: Text("Edit or Delete"), buttons: [
        .default(Text("Edit Post"), action: {
          print("edited post")
        }),
        .default(Text("Delete Post"), action: {
          print("Deleted post")
          print("\(self.post.id)")
        }),
        .cancel()
      ])
    }
    
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
                             userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                             uiImage: UIImage(named: "octopus")))
  }
}
