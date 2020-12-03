//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

protocol DetailViewDelegate : class {
    func favoriteButtonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    var content: Content? {
        didSet {
            guard let content = self.content else { return }
            iconView.image = UIImage(named: content.iconName)
            nameLabel.attributedText = content.name.styled(with: StringStyle(
                .font(UIFont.defaultBold(16)), .alignment(.left)
            ))
            var appsString = [NSAttributedString]()
            content.media.forEach { brand in
                appsString.append("<brand>\(brand.text)</brand> @MasaYanagida".styled(with: StringStyle(
                    .font(UIFont.default(14)),
                    .color(.lightGray),
                    .lineSpacing(6),
                    .xmlRules([
                        .style("brand", StringStyle(
                            .font(UIFont.faBrand(18)),
                            .color(brand.color)
                        ))
                    ])
                )))
            }
            appsLabel.attributedText = appsString.joined(separator: "\n")
            
            introductionLabel.attributedText = content.introduction.styled(with: StringStyle(
                .font(UIFont.defaultBold(14)), .alignment(.left), .lineSpacing(4), .lineBreakMode(.byTruncatingTail)
            ))
            imageView.image = UIImage(named: content.imageName)
        }
    }
    
    @IBOutlet private dynamic weak var iconView: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var appsLabel: UILabel!
    @IBOutlet private dynamic weak var introductionLabel: UILabel!
    @IBOutlet private dynamic weak var imageView: UIImageView!
    
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        delegate?.favoriteButtonTouchUpInside(self)
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
