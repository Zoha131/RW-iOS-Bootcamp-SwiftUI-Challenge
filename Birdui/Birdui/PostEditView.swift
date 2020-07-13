//
//  PostEditView.swift
//  Birdui
//
//  Created by Emilio Rodriguez on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostEditView: View {
  var postHandler : PostViewModel
  var post : MediaPost
  @Environment(\.presentationMode) var presentationMode
  
  @State var textBody : String
  
    var body: some View {
      VStack {
        Text("Edit Post")
        
        Form {
          TextField("Body", text: $textBody)
        }
        HStack{
          Button("Cancel"){
            self.presentationMode.wrappedValue.dismiss()
          }
          Spacer()
          Button("Edit"){
            self.postHandler.editPost(post: self.post, newText: self.textBody)
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      .padding()
      }
      
    }
}

struct PostEditView_Previews: PreviewProvider {
  static var previews: some View {
    PostEditView(postHandler: PostViewModel(), post: MediaPost(textBody: "Went to the Aquarium today :]",
                          userName: "Audrey",
                          timestamp: Date(timeIntervalSinceNow: -9876),
                                                    uiImage: UIImage(named: "octopus")), textBody:"This is for preivew")
  }
}
