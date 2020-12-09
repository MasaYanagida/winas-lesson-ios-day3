//
//  TitleView.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/12/02.
//

import UIKit
import SnapKit

class TitleView: UIView {
    
    var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
    // MARK: Private

    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textColor = .black
        addSubview(label)
        return label
    }()

    private lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        addSubview(view)
        return view
    }()
    
    private func setup() {
        label.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-20)
        }
        borderView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.right.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(0.5)
        }
    }
    
    // MARK: UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}
