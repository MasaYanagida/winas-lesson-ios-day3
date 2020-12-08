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
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textColor = .black
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
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    private func setupUI() {
        label.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
            make.height.lessThanOrEqualTo(100)
        }
        
        borderView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.right.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(0.5)
        }
    }
    
    func setupTitle() {
        let titleBrand = BrandIcon.twitter
        let titleText = "\u{1F4A1}<brand>\(titleBrand.text)</brand> <bold>\(titleBrand.name)</bold>"
        let attributedString: NSAttributedString = titleText.styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black),
            .lineSpacing(6),
            .xmlRules([
                .style("bold", StringStyle(
                    .font(UIFont.defaultBold(20)),
                    .color(titleBrand.color)
                )),
                .style("brand", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(titleBrand.color)
                ))
            ])
        ))
        let textString = "からのコンテンツです".styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black)
        ))
        label.attributedText = NSAttributedString.composed(of: [attributedString, textString], baseStyle: StringStyle(), separator: " ")
    }
}
