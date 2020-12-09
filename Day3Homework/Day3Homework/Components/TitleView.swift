//
//  TitleView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import SnapKit
import BonMot

class TitleView: UIView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines   = 0
        label.textColor       = .black
        addSubview(label)
        
        return label
    }()
    
    private lazy var borderView: UIView = {
        let borderView = UIView()
        borderView.backgroundColor = .gray
        addSubview(borderView)
        
        return borderView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.placeUI()
    }
    
    private func placeUI() {

        label.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
            make.height.lessThanOrEqualTo(100)
        }

        borderView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.right.equalTo(-15)
            make.left.equalTo(15)
            make.height.equalTo(0.5)
        }
    }
    
    func setTitle() {
        let brandIcon: BrandIcon? = BrandIcon.twitter
        let titleText = "\u{1F4A1}<brand>\(brandIcon!.text)</brand> <bold>\(brandIcon!.name)</bold>"
        let attributedString: NSAttributedString = titleText.styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black),
            .lineSpacing(6),
            .xmlRules([
                .style("bold", StringStyle(
                    .font(UIFont.defaultBold(20)),
                    .color(brandIcon!.color)
                )),
                .style("brand", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(brandIcon!.color)
                ))
            ])
        ))
        let textString = "からのコンテンツです".styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black)
        ))
        label.attributedText = NSAttributedString.composed(of: [attributedString, textString], baseStyle: StringStyle(), separator: "")
    }

}
