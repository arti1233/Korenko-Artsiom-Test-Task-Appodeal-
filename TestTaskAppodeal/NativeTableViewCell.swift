import Foundation
import UIKit
import SnapKit
import Appodeal

final class NativeTableViewCell: UITableViewCell {

    static var key = "NativeTableViewCell"
    
    private lazy var mainView: UIView = {
        var view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.5)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 5, height: 4)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        var view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = UIImage(systemName: "person")
        nameLabel.text = "Hello world"
    }
        
    func configureNativeCell(info: APDNativeAd) {
        nameLabel.text = info.title + " " + info.description
        if let image = info.iconImage?.url {
            downloadImage(from: image)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(mainView)
        mainView.addSubview(iconImage)
        mainView.addSubview(nameLabel)
        iconImage.image = UIImage(systemName: "person")
        nameLabel.text = "Hello world"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                guard let self else { return }
                self.iconImage.image = UIImage(data: data)
            }
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        mainView.snp.makeConstraints {
            $0.trailing.leading.top.bottom.equalToSuperview().inset(8)
        }
        
        iconImage.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalTo(iconImage.snp.trailing).inset(16)
        }
    }
}
