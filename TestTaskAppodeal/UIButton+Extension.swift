import Foundation
import UIKit

class BasicButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .white
        backgroundColor = .blue
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
