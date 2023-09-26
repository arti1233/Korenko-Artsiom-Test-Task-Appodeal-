import Foundation
import UIKit
import SnapKit
import Appodeal

final class NativeViewController: UIViewController {
    
    private lazy var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.register(NativeViewCell.self, forCellReuseIdentifier: NativeViewCell.key)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var completion: (() -> ())?
    
    var nativeArray: [APDNativeAd] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTableView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let completion else { return }
        completion() 
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        mainTableView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(view.safeAreaInsets.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

//MARK: - Extension for NativeViewController

extension NativeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nativeArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NativeViewCell.key) as? NativeViewCell else { return UITableViewCell() }
        cell.configureNativeAd(nativeArray[indexPath.row], viewController: self)
        return cell
    }
}

extension NativeViewController : APDNativeAdQueueDelegate {
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {}
    func adQueue(_ adQueue: APDNativeAdQueue, failedWithError error: Error) {}
}

extension APDNativeAd {
    func show(on superview: UIView, controller: UIViewController) {
        getViewFor(controller).map {
            superview.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints {
                $0.trailing.leading.top.bottom.equalToSuperview().inset(8)
                $0.height.equalTo(300)
            }
        }
    }
}
