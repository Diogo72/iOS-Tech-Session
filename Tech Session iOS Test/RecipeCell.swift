//
//  RecipeCell.swift
//  Tech Session iOS Test
//
//  Created by Diogo Martins on 25/06/2020.
//  Copyright © 2020 Nutrium. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RecipeCell: UITableViewCell {
  let titleLabel = UILabel()
  let descriptionLabel = UILabel()
  let recipeImageView = UIImageView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)
    contentView.addSubview(recipeImageView)

    titleLabel.snp.makeConstraints { make in
      make.top.left.equalToSuperview().offset(12)
      make.right.equalTo(recipeImageView.snp.left).offset(-88)
    }

    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(8)
      make.left.equalTo(titleLabel.snp.left)
      make.bottom.equalToSuperview().offset(-8)
      make.right.equalTo(recipeImageView.snp.left).offset(-8)
    }

    recipeImageView.snp.makeConstraints { make in
      make.right.equalToSuperview().offset(-12)
      make.centerY.equalToSuperview()
      make.width.equalTo(100)
      make.height.equalTo(60)
    }

    recipeImageView.image = UIImage(named: "defaultRecipe")
    recipeImageView.contentMode = .scaleAspectFill
    recipeImageView.clipsToBounds = true

    titleLabel.font = UIFont.systemFont(ofSize: 15)
    descriptionLabel.font = UIFont.systemFont(ofSize: 13)
    descriptionLabel.lineBreakMode = .byWordWrapping
    descriptionLabel.numberOfLines = 0
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
