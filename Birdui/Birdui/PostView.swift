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
  var onImageClick: ((MediaPost) -> Void)?
  
  var body: some View {
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
    
    HStack(alignment: .top){
      
      Image("mascot_swift-badge")
        .resizable()
        .frame(width: 50, height: 50)
      
        VStack(alignment: .leading) {
          
          Text("\(post.userName)")
            .fontWeight(.medium)
            .padding(.top, 5)
          
          Text("\(post.getFormatedDate())")
            .font(.system(size: 12))
            .padding(.bottom, 15)
          
          Text("\(post.textBody ?? "")")
            .font(.system(size: 16))
            .fontWeight(.light)
          
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
        }

      Spacer()
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(
      textBody: "Went to the Aquarium today :]",
      userName: "Audrey",
      timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "ray")))
  }
}
