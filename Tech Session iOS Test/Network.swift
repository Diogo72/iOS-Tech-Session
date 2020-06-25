//
//  Network.swift
//  Tech Session iOS Test
//
//  Created by Diogo Martins on 25/06/2020.
//  Copyright © 2020 Nutrium. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Network {
  static let url = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet"

  static func getRecipes(completion: @escaping (JSON) -> Void) {
    AF.request(url).responseJSON { response in
      let result = try! response.result.get()

      completion(JSON(result))
    }
  }
}
