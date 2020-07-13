//
//  ReactionButton.swift
//  Birdui
//
//  Created by Zoha on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ReactionButton: View {
  
  var reactionType : ReactionType
  var reactionCount: Int
  var isReacted : Bool
  var onRaction : ((ReactionType) -> Void)
  
  private var systemName: String {
    if isReacted {
      return "\(reactionType.rawValue).fill"
    } else {
      return reactionType.rawValue
    }
  }
  
  private var color: Color {
    if isReacted {
      if (reactionType.rawValue == ReactionType.love.rawValue){
        return Color.red
      }else {
        return Color.blue
      }
    } else {
      return Color.gray
    }
  }
  
  var body: some View {
    HStack(spacing: 0){
      Button(action: {
        self.onRaction(self.reactionType)
      }) {
        Image(systemName: self.systemName)
          .resizable()
          .foregroundColor(color)
          .frame(width: 20, height: 20, alignment: .center)
        
      }
      .buttonStyle(BorderlessButtonStyle())
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 3))
      
      Text("\(reactionCount)")
        .font(.system(size: 14))
        .fontWeight(.medium)
        .foregroundColor(color)
        .frame(minWidth: 10, idealWidth: 12, maxWidth: 25)
      
    }.frame(minWidth: 30, idealWidth: 50, maxWidth: 60)
    
    // Given all the views a fixed height width so that
    // one button or view does not others' layout
  }
}

struct ReactionButton_Previews: PreviewProvider {
  static var previews: some View {
    ReactionButton(
      reactionType: .like,
      reactionCount: 88,
      isReacted: false) { (reactionType) in }
  }
}
