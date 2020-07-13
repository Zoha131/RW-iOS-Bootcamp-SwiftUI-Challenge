//
//  ImageViewerView.swift
//  Birdui
//
//  Created by Zoha on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ImageViewerView: View {
  
  let post: MediaPost
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 0) {
      
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }) {
        Image(systemName: "xmark")
          .foregroundColor(.gray)
        
      }.padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
      
      Spacer()
      
      Image(uiImage: post.uiImage!)
        .resizable()
        .aspectRatio(contentMode: .fit)
      
      Spacer()
      
    }
  }
}

struct ImageViewerView_Previews: PreviewProvider {
  static var previews: some View {
    ImageViewerView(post: MediaPost(
      textBody: "Went to the Aquarium today :]",
      userName: "Audrey",
      timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus"))
    )
  }
}
