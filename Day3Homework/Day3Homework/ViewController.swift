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
        titleView.setupTitle()
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
        // Do any additional setup after loading the view.
        
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(height + 20)
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

extension ViewController: DetailViewDelegate {
    func buttonTouchUpInside(_ view: DetailView) {
        let alert = UIAlertController(title: "", message: "Favourite button pressed!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
