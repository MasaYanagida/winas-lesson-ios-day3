//
//  ViewController.swift
//  Day3Sample
//
//  Created by 柳田昌弘 on 2020/11/29.
//

import UIKit
import BonMot

let ImageFileName = "https://cloud.githubusercontent.com/assets/1567433/9781817/ecb16e82-57a0-11e5-9b43-6b4f52659997.jpg"

class ViewController: UIViewController {
    
    private lazy var titleView: TitleView = {
        let titleView = TitleView(frame: CGRect.zero)
        titleView.text = "これはタイトルです"
        view.addSubview(titleView)
        return titleView
    }()
    
    private lazy var detailView: DetailView = {
        let detailView = DetailView.createFromNib()
        detailView.delegate = self
        detailView.content = Content.create()
        view.addSubview(detailView)
        return detailView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        titleView.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(UIApplication.shared.statusBarFrame.height)
//            make.left.equalTo(view).offset(0)
//            make.right.equalTo(view).offset(0)
//        }
//        detailView.snp.makeConstraints { make in
//            make.top.equalTo(titleView.snp.bottom).offset(20)
//            make.left.equalTo(0)
//            make.right.equalTo(0)
//            make.bottom.lessThanOrEqualTo(-20)
//        }
//        detailView.content = Content.create()
        
        imageView.image = UIImage(named: "sample")
        imageView.image = #imageLiteral(resourceName: "sample")
        imageView.image = UIImage(named: "sample2.jpg")
        
        let brandIcon = BrandIcon.instagram
        imageView.image = UIImage.brandIcon(icon: brandIcon, color: brandIcon.color, fontSize: 128)
        
        imageView.loadNukeImage(URL(string: ImageFileName)!)
        
        textLabel.text = "test"
        textLabel.attributedText = "test".styled(with: StringStyle(
            .font(UIFont.default(20)), .color(.red)
        ))
        
        // XML
        let favoriteApp = BrandIcon.twitter
        let text = "私の<bold>好きなアプリ</bold>は、<brand>\(favoriteApp.text)</brand>です！"
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
        textLabel.attributedText = attributedString
        
        // 連結
        let iconString: NSAttributedString = favoriteApp.text.styled(with: StringStyle(
            .font(UIFont.faBrand(40)),
            .color(favoriteApp.color)
        ))
        let textString = "◀️こちらが、私の好きなアプリです！".styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black)
        ))
        textLabel.attributedText = NSAttributedString.composed(of: [iconString, textString], baseStyle: StringStyle(), separator: "    ")
    }
    
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var textLabel: UILabel!
}

extension ViewController: DetailViewDelegate {
    func buttonTouchUpInside(_ view: DetailView) {
        let controller = UIAlertController.init(title: nil, message: "button", preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}

