//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

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
        
        var snsAppArray: [NSAttributedString] = []
        for data in content.media {
            let appIconString: NSAttributedString = data.text.styled(with: StringStyle(
                .font(UIFont.faBrand(20)),
                .color(data.color)
            ))
            let appName = snsAppName.styled(with: StringStyle(
                .font(UIFont.default(15)),
                .color(.gray)
            ))
            let appString = NSAttributedString.composed(of: [appIconString, appName], baseStyle: StringStyle(), separator: " ")
            snsAppArray.append(appString)
        }
        mediaLabel.attributedText = NSAttributedString.composed(of: snsAppArray, baseStyle: StringStyle(), separator: "\r\n")
        mediaLabel.numberOfLines = snsAppArray.count
        iconImageView.image = UIImage(named: "userIcon")
        imageView.image = UIImage(named: content.imageName)
        nameLabel.text = content.name
        introductionLabel.text = content.introduction
    }
    
    let snsAppName = "@watanabe"
    
    @IBOutlet private dynamic weak var iconImageView: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var textLabel: UILabel!
    @IBOutlet private dynamic weak var mediaLabel: UILabel!
    @IBOutlet private dynamic weak var introductionLabel: UILabel!
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
