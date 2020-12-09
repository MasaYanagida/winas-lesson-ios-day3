//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

protocol DetailViewDelegate: class {
    func buttonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    // private var snsView: UIView!
    
    // TODO : implement this
    @IBOutlet private dynamic weak var userView: UIStackView!
    @IBOutlet private dynamic weak var iconImage: UIImageView!
    @IBOutlet private dynamic weak var name: UILabel!
    @IBOutlet private dynamic weak var snsView: UIView!
    @IBOutlet private dynamic weak var introduction: UILabel!
    @IBOutlet private dynamic weak var backgroundImage: UIImageView!
    @IBOutlet private dynamic weak var favoriteButton: UIButton!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        delegate?.buttonTouchUpInside(self)
    }
    
    weak var delegate: DetailViewDelegate?
    var content: Content? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        guard let content = self.content else { return }
        iconImage.image = UIImage(named: content.iconName)
        name.attributedText = content.name.styled(with: StringStyle(
                .font(UIFont.boldSystemFont(ofSize: 20))
        ))
        //introduction.attributedText = content.introduction.styled(with: StringStyle(
        //    .font(UIFont.boldSystemFont(ofSize: 16))
        //))
        introduction.text = "aaaaa"
        backgroundImage.image = UIImage(named: content.imageName)
        
        //self.snsView = UIView()
        var offset = 0
        for item in content.media {
            let label = self.addSnsAccount(brandIcon: item)
            label.snp.makeConstraints { make in
                //make.bottom.equalTo(introduction.snp.top).offset(16)
                make.left.equalTo(20)
                make.right.equalTo(20)
                make.top.equalTo(userView.snp.bottom).offset(offset)
            }
            offset += 20
        }

        introduction.snp.makeConstraints { make in
            make.top.equalTo(userView.snp.bottom).offset(offset+10)
        }

}
    
    private func addSnsAccount(brandIcon: BrandIcon) -> UILabel {
        let iconString: NSAttributedString = brandIcon.text.styled(with: StringStyle(
            .font(UIFont.faBrand(14)),
            .color(brandIcon.color)
        ))
        let appNameString: NSAttributedString = brandIcon.name.styled(with: StringStyle(
            .font(UIFont.default(12)),
            .color(.gray)
        ))
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.attributedText = NSAttributedString.composed(of: [iconString, appNameString], baseStyle: StringStyle(), separator: "    ")
        snsView.addSubview(label)
        
        return label
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
