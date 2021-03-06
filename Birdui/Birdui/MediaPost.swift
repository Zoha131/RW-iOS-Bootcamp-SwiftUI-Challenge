//
//  AppDelegate.swift
//  Birdui
//
//  Created by Audrey Tam on 3/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

struct MediaPost: Identifiable {
  let id: UUID
  var textBody: String
  let userName: String
  let timestamp: Date
  let uiImage: UIImage?
  var edited = false
  var reaction: Reaction
  
  init(id: UUID = UUID(), textBody: String, userName: String, timestamp: Date, uiImage: UIImage? = nil, reaction: Reaction = Reaction()) {
    self.id = id
    self.textBody = textBody
    self.userName = userName
    self.timestamp = timestamp
    self.uiImage = uiImage
    self.reaction = reaction
  }
  
  func updateReaction(reactionType: ReactionType) -> MediaPost{
    return  MediaPost(
      id: self.id,
      textBody: self.textBody,
      userName: self.userName,
      timestamp: self.timestamp,
      uiImage: self.uiImage,
      reaction: self.reaction.updateReactionType(reactionType: reactionType)
    )
  }
  
}

extension MediaPost: Equatable {
  
  func getFormatedDate() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMd'T'HH:mm")
    
    return dateFormatter.string(from: timestamp)
  }
  
  static func == (lhs: MediaPost, rhs: MediaPost) -> Bool {
    return lhs.id == rhs.id
  }
}
