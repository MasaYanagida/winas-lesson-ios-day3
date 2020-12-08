//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit

protocol DetailViewDelegate: class {
    func buttonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    // TODO : implement this
    weak var delegate: DetailViewDelegate?
    
    var content: Content? {
        didSet{
            update()
        }
    }
    
    func update(){
        guard let content = self.content else {return}
        nameLabel.text  = content.name
        introLabel.text = content.introduction
        mainImage.image = UIImage(named: content.imageName)
        
    }
    
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
    
    @IBOutlet private dynamic weak var iconImage: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var introLabel: UILabel!
    @IBOutlet private dynamic weak var mainImage: UIImageView!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton){
        delegate?.buttonTouchUpInside(self)
    }
}
