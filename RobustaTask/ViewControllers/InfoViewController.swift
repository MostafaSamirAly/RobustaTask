//
//  InfoViewController.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    var presenter: InfoViewControllerPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getRepository()
    }
    
    @IBAction func openInBrowserTapped(_ sender: Any) {
        presenter?.openBrowserTapped()
    }
    

}

extension InfoViewController: InfoViewControllerProtocol{
    func updateView(repo: RepositoryModel) {
        
        avatarImageView.sd_setImage(with: URL(string: repo.repoOwner.imagePath), completed: nil)
        ownerNameLabel.text = repo.repoOwner.name
        describtionLabel.text = repo.repoDescription
        navigationController?.navigationBar.topItem?.title = "\(repo.repoOwner.name)'s Repository"
    }
    
    func openBrowserWith(url: String) {
        guard let url = URL(string: url) else {
            Helper.showErrorAlert(view: self, error: "Cannot open this repo" )
            return
        }
       UIApplication.shared.open(url)
    }
    
}
