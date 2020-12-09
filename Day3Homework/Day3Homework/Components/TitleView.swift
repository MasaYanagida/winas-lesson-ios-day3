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
    // TODO : implement this
    
    var icon: BrandIcon? {
        didSet {
            setupIcon()
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    private lazy var border: UIView = {
       let border = UIView()
        border.backgroundColor = .gray
        addSubview(border)
        return border
    }()
    
    private func setupIcon() {
        guard let brandIcon = self.icon else { return }
        let text = "<icon>\(brandIcon.text)</icon><name>\(brandIcon.name)</name>からのコンテンツです"
        let attributedString: NSAttributedString = text.styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black),
            .lineSpacing(6),
            .xmlRules([
                .style("icon", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(brandIcon.color)
                )),
                .style("name", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(brandIcon.color)
                ))
            ])
        ))
        label.attributedText = attributedString
    }
    
    private func setup() {
        label.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(30)
            make.right.equalTo(-15)
            make.bottom.equalTo(-10)
        }
        
        border.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(0)
            
            make.height.equalTo(0.5)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}
