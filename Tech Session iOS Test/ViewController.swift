//
//  ViewController.swift
//  Tech Session iOS Test
//
//  Created by Diogo Martins on 25/06/2020.
//  Copyright © 2020 Nutrium. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
  let tableView = UITableView()
  var recipes: [Recipe] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    loadRecipes()
  }

  func setupTableView() {
//    tableView.separatorStyle  = .none
    tableView.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
    tableView.rowHeight       = UITableView.automaticDimension

    tableView.register(RecipeCell.self, forCellReuseIdentifier: "recipeCell")

    tableView.dataSource = self

    view.addSubview(tableView)

    tableView.snp.makeConstraints { make in
      make.top.left.right.bottom.equalToSuperview()
    }
  }

  func loadRecipes() {
    Network.getRecipes { [weak self] json in
      self?.recipes = Recipe.parseJSON(json: json)

      self?.tableView.reloadData()
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let recipeCell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeCell
    let recipe = recipes[indexPath.row]

    recipeCell.titleLabel.text = recipe.name
    recipeCell.descriptionLabel.text = recipe.ingredients

    if let url = recipe.imageURL {
      recipeCell.recipeImageView.kf.setImage(with: url)
    }

    return recipeCell
  }
}

