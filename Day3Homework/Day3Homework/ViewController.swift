//
//  ViewController.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titleView: TitleView = {
        let titleView = TitleView(frame: .zero)
        titleView.brand = BrandIcon.random()
        view.addSubview(titleView)
        return titleView
    }()
    private lazy var detailView: DetailView = {
        let detailView = DetailView.createFromNib()
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
        detailView.content = Content.create()
        detailView.delegate = self
        detailView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }
    }
}

extension ViewController: DetailViewDelegate {
    func favoriteButtonTouchUpInside(_ view: DetailView) {
        guard let content = view.content else { return }
        let alert = UIAlertController.init(title: nil, message: "\(content.name)さんをお気に入りにしました！", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
