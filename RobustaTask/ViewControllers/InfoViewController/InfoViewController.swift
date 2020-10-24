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
