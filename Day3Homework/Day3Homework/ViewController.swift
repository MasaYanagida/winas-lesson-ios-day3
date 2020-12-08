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
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIApplication.shared.statusBarFrame.height)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
        }
        
        detailView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.lessThanOrEqualTo(0)
        }
    }
}

extension ViewController: DetailViewDelegate {
    func buttonTouchUpInside(_ view: DetailView) {
        let controller = UIAlertController.init(title: nil, message: "お気に入りに追加しました。", preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}

