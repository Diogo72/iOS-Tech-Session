//
//  Recipe.swift
//  Tech Session iOS Test
//
//  Created by Diogo Martins on 25/06/2020.
//  Copyright © 2020 Nutrium. All rights reserved.
//

import Foundation
import SwiftyJSON

class Recipe {
  let name: String
  let ingredients: String
  let recipeURL: String
  let imageURL: URL?

  init(json: JSON) {
    self.name = json["title"].stringValue
    self.ingredients = json["ingredients"].stringValue
    self.recipeURL = json["href"].stringValue
    self.imageURL = json["thumbnail"].url
  }

  static func parseJSON(json: JSON) -> [Recipe] {
    var recipes: [Recipe] = []

    for (_, recipeJSON) in json["results"] {
      recipes.append(Recipe(json: recipeJSON))
    }

    return recipes
  }
}
