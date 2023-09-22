import Foundation
import UIKit
import SnapKit
import Appodeal

private enum TableSection: Int, CaseIterable {
    case cells = 0
    case nativeCell
}

final class NativeViewController: UIViewController {

    private lazy var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.register(NativeTableViewCell.self, forCellReuseIdentifier: NativeTableViewCell.key)
        tableView.separatorStyle = .none
        return tableView
    }()

    var nativeArray: [APDNativeAd] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTableView)
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
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableSection.allCases[section] {
        case .cells:
            return 5
        case .nativeCell:
           return  nativeArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NativeTableViewCell.key) as? NativeTableViewCell else { return UITableViewCell() }
        
        switch TableSection.allCases[indexPath.section] {
        case .cells:
            cell.prepareForReuse()
            cell.updateConstraints()
            return cell
        case .nativeCell:
            cell.prepareForReuse()
            cell.configureNativeCell(info: nativeArray[indexPath.row])
            cell.updateConstraints()
            return cell
        }
    }
}

