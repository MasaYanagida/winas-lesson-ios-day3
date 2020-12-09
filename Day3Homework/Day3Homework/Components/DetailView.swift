//
//  DetailView.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import UIKit
import BonMot

protocol DetailViewDelegate: class {
    func buttonTouchUpInside(_ view: DetailView)
}

class DetailView: UIView {
    
    weak var detailViewDelegate: DetailViewDelegate?
    @IBOutlet private var NameLabel: UILabel!
    @IBOutlet private var MessengerLabel: UILabel!
    @IBOutlet private var InstagramLabel: UILabel!
    @IBOutlet private var SnapChatLabel: UILabel!
    @IBOutlet private var LineLabel: UILabel!
    @IBOutlet private var RedditLabel: UILabel!
    @IBOutlet private var WhatsAppLabel: UILabel!
    @IBOutlet private var TwitterLabel: UILabel!
    @IBOutlet private var IntroductionLabel: UILabel!
    @IBAction func buttonTouchUp(_ sender: Any) {
        detailViewDelegate?.buttonTouchUpInside(self)
    }
    
    var content: Content? {
        didSet {
            getContent()
        }
    }
    
    class func createFromNib() -> DetailView {
        let xib = UINib(nibName: "DetailView", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
    
    func getContent() {
        guard let content = self.content else { return }
        NameLabel.text = content.name
        IntroductionLabel.text = content.introduction
        setSnsList(content)
    }
    
    private func setSnsList(_ content: Content) {
        for media in content.media {
            switch media {
            case .twitter:
                TwitterLabel.isHidden = false
                setupMediaContent(media, TwitterLabel)
            case .instagram:
                InstagramLabel.isHidden = false
                setupMediaContent(media, InstagramLabel)
            case .snapchat:
                SnapChatLabel.isHidden = false
                setupMediaContent(media, SnapChatLabel)
            case .reddit:
                RedditLabel.isHidden = false
                setupMediaContent(media, RedditLabel)
            case .line:
                LineLabel.isHidden = false
                setupMediaContent(media, LineLabel)
            case .whatsapp:
                WhatsAppLabel.isHidden = false
                setupMediaContent(media, WhatsAppLabel)
            case .fbmessenger:
                MessengerLabel.isHidden = false
                setupMediaContent(media, MessengerLabel)
            }
        }
    }
    
    private func setupMediaContent(_ brand: BrandIcon, _ label: UILabel) {
        let titleText = "<brand>\(brand.text)</brand> <bold>@\(brand.name)</bold>"
        let attributedString: NSAttributedString = titleText.styled(with: StringStyle(
            .font(UIFont.default(20)),
            .color(.black),
            .lineSpacing(6),
            .xmlRules([
                .style("bold", StringStyle(
                    .font(UIFont.defaultBold(20)),
                    .color(.lightGray)
                )),
                .style("brand", StringStyle(
                    .font(UIFont.faBrand(20)),
                    .color(brand.color)
                ))
            ])
        ))
        
        label.attributedText = attributedString
    }

}
