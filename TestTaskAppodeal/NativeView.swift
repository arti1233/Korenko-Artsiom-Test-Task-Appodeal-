import UIKit
import Appodeal
import SnapKit

final class NativeView: UIView {

    
    private lazy var title = UILabel()
    private lazy var callToAction = UILabel()
    private lazy var descriptionText = UILabel()
    private lazy var icon = UIImageView()
    private lazy var mediaContainer = UIView()
    private lazy var adChoices = UIView()
    
    override func draw(_ rect: CGRect) {
        addSubview(title)
        addSubview(callToAction)
        addSubview(descriptionText)
        addSubview(icon)
        addSubview(mediaContainer)
        addSubview(adChoices)
    }
}

extension NativeView : APDNativeAdView {
    
    func titleLabel() -> UILabel {
        return title
    }
    
    func callToActionLabel() -> UILabel {
        return callToAction
    }
    
    func descriptionLabel() -> UILabel {
        return descriptionText
    }
    
    func iconView() -> UIImageView {
        return icon
    }
    
    func mediaContainerView() -> UIView {
        return mediaContainer
    }
    
    func adChoicesView() -> UIView {
        return adChoices
    }
}

