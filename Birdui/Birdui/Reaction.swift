//
//  Reaction.swift
//  Birdui
//
//  Created by Zoha on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

struct Reaction {
  let likeCount: Int
  let dislikeCount: Int
  let loveCount: Int
  let userReactionType: ReactionType
  
  init(likeCount: Int = 0, dislikeCount: Int = 0, loveCount: Int = 0, userReactionType: ReactionType = .none) {
    self.likeCount = likeCount
    self.dislikeCount = dislikeCount
    self.loveCount = loveCount
    self.userReactionType = userReactionType
  }
  
  func updateReactionType(reactionType: ReactionType) -> Reaction {
    
    var like = self.likeCount
    var dislike = self.dislikeCount
    var love = self.loveCount
    
    switch userReactionType {
    case .like:
      like -= 1
    case .dislike:
      dislike -= 1
    case .love:
      love -= 1
    default:
      break
    }
    
    switch reactionType {
    case .like:
      like += 1
    case .dislike:
      dislike += 1
    case .love:
      love += 1
    default:
      break
    }
    
    return Reaction(
      likeCount: like,
      dislikeCount: dislike,
      loveCount: love,
      userReactionType: reactionType
    )
  }
}

enum ReactionType: String{
  case like = "hand.thumbsup"
  case dislike = "hand.thumbsdown"
  case love = "heart"
  case none = "none"
}
