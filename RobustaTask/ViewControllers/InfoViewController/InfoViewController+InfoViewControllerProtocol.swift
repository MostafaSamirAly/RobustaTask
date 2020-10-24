//
//  InfoViewController+InfoViewControllerProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/24/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

extension InfoViewController: InfoViewControllerProtocol{
    func updateView(repo: RepositoryModel) {
        
        avatarImageView.sd_setImage(with: URL(string: repo.repoOwner.imagePath), completed: nil)
        ownerNameLabel.text = repo.repoOwner.name
        describtionLabel.text = repo.repoDescription
        self.navigationItem.title = "\(repo.repoOwner.name)'s Repository"
    }
    
    func openBrowserWith(url: String) {
        guard let url = URL(string: url) else {
            Helper.showErrorAlert(view: self, error: "Cannot open this repo" )
            return
        }
       UIApplication.shared.open(url)
    }
    
}
