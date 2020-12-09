//
//  ViewController.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var titleView: TitleView = {
        let titleView = TitleView(frame: .zero)
        titleView.brandIcon = .twitter
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
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(height + 70)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
        }
        
        detailView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.lessThanOrEqualTo(-20)
        }
    }
}

extension ViewController: DetailViewProtocol {
    
    func didTapOnFavoriteButton(_ view: DetailView) {
        let alert = UIAlertController(title: "", message: "Favorite is added !!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
