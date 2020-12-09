//
//  ViewController.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit

class ViewController: UIViewController {

    private lazy var titleView: TitleView = {
        let titleView = TitleView(frame: CGRect.zero)
        view.addSubview(titleView)
        return titleView
    }()
    
    private lazy var detailView: DetailView = {
        let detailView = DetailView.createFromNib()
        detailView.delegate = self
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
            make.top.equalTo(titleView.snp.bottom).offset(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.lessThanOrEqualTo(-20)
            
        }
        
        titleView.icon = BrandIcon.line
        detailView.content = Content.create()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: DetailViewDelegate {
    
    func buttonTouchUpInside(_ view: DetailView) {
        let controller = UIAlertController.init(title: nil, message: "お気に入りに登録しました", preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}

