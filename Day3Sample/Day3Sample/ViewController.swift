//
//  ViewController.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/11/29.
//

import UIKit
import BonMot
import Nuke

let ImageFileName = "https://cloud.githubusercontent.com/assets/1567433/9781817/ecb16e82-57a0-11e5-9b43-6b4f52659997.jpg"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var textLabel: UILabel!
}

