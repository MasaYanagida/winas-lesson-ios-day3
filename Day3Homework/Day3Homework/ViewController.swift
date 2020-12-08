//
//  ViewController.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

class ViewController: UIViewController {

    private lazy var titleView: TitleView = {
        let titleView = TitleView(frame: .zero)
        
        
        view.addSubview(titleView)
        return titleView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titlelabel = UILabel()
        let favoriteApp = BrandIcon.twitter
        let text = "<brand>\(favoriteApp.text)\(favoriteApp.name)</brand>からのコンテンツです"
        let attributedString: NSAttributedString = text.styled(with: StringStyle(
                .font(UIFont.default(20)),
                .color(.black),
                .lineSpacing(6),
                .xmlRules([
                    .style("bold", StringStyle(
                        .font(UIFont.defaultBold(30)),
                        .color(.red)
                    )),
                    .style("brand", StringStyle(
                        .font(UIFont.faBrand(20)),
                        .color(favoriteApp.color)
                    ))
                ])
            ))
        titlelabel.attributedText = attributedString
        
        titleView.addSubview(titlelabel)
        return titlelabel
    }()
    
    // DetailView
    private lazy var detailView : DetailView = {
        let detailView = DetailView.createFromNib()
        detailView.delegate = self
        detailView.content = Content.create()
        
        view.addSubview(detailView)
        return detailView
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleView.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(UIApplication.shared.statusBarFrame.height)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.top).offset(10)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
        }
//
        // DetailView
        detailView.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
    }
}

extension ViewController: DetailViewDelegate{
    func buttonTouchUpInside(_ view: DetailView) {
        let controller = UIAlertController.init(title: nil, message: "お気に入りに追加", preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}
