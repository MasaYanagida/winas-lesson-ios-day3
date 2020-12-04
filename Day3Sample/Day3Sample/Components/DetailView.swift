//
//  DetailView.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/12/02.
//

import UIKit

protocol DetailViewDelegate : class {
    func buttonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    var content: Content? {
        didSet {
            update()
        }
    }
    
    func update() {
        guard let content = self.content else { return }
        imageView.image = UIImage(named: content.imageName)
        textLabel.text = content.introduction
    }
    
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var textLabel: UILabel!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        delegate?.buttonTouchUpInside(self)
    }
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
}
