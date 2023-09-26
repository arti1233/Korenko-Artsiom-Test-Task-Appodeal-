import Foundation
import UIKit
import SnapKit
import Appodeal

final class NativeViewCell: UITableViewCell {
    
    static let key = "NativeViewCell"
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink.withAlphaComponent(0.1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.trailing.leading.bottom.top.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNativeAd(_ info: APDNativeAd, viewController: UIViewController) {
        info.show(on: mainView, controller: viewController)
    }
}

