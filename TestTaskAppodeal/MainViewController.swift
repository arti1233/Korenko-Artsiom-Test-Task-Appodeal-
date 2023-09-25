import UIKit
import SnapKit
import Appodeal

private enum Constants {
    static let bannersButtonName = "Banners"
    static let interstitialsButtonName = "Interstitials"
    static let rewardedVideoButtonName = "Rewarded Video"
    static let nativeButtonName = "Native"
    static let defaultValueForСounter = 0
    static let timerInterval = 60
    static let maxViewedRewardedVideo = 3
    static let maxViewedBanners = 5
    static let sideInset = 50
    static let buttonOffset = 16
    static let maxNativeCell = 5
}

final class MainViewController: UIViewController {
   
    
    private lazy var bannersButton: BasicButton = {
        let button = BasicButton(type: .system)
        button.setTitle(Constants.bannersButtonName, for: .normal)
        button.addTarget(self, action: #selector(bannersButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var interstitialsButton: BasicButton = {
        let button = BasicButton(type: .system)
        button.setTitle(Constants.interstitialsButtonName, for: .normal)
        button.addTarget(self, action: #selector(interstitialsButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var rewardedVideoButton: BasicButton = {
        let button = BasicButton(type: .system)
        button.setTitle(Constants.rewardedVideoButtonName, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(rewardedVideoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var nativeButton: BasicButton = {
        let button = BasicButton(type: .system)
        button.setTitle(Constants.nativeButtonName, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(nativeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var nativeAdQueue: APDNativeAdQueue!
    var nativeArray: [APDNativeAd] = []
    
    private var bannerCount = Constants.defaultValueForСounter
    private var rewardedVideoCount = Constants.defaultValueForСounter
    
//MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeAdQueue = APDNativeAdQueue()
        nativeAdQueue.settings = APDNativeAdSettings.default()
        nativeAdQueue.delegate = self
        nativeAdQueue.settings.autocacheMask = [.icon, .media]
        
        nativeAdQueue.loadAd()
        
        
        addSubviews()
        addConstraints()
        addAppodealDelegate()
        
        Appodeal.setSmartBannersEnabled(true)
        Appodeal.setBannerAnimationEnabled(true)
        view.backgroundColor = .white
    }
    
//MARK: - Actions for buttons
    
    @objc private func bannersButtonPressed(sender: UIButton) {
        Appodeal.hideBanner()
        bannerCount = Constants.defaultValueForСounter
        Appodeal.showAd(.bannerTop, rootViewController: self)
    }
    
    @objc private func interstitialsButtonPressed(sender: UIButton) {
        Appodeal.hideBanner()
        Appodeal.showAd(.interstitial, rootViewController: self)
        interstitialsButton.isEnabled = false
    }
    
    @objc private func rewardedVideoButtonPressed(sender: UIButton) {
        Appodeal.hideBanner()
        Appodeal.showAd(.rewardedVideo, rootViewController: self)
        rewardedVideoButton.isEnabled = false
    }
    
    @objc private func nativeButtonPressed(sender: UIButton) {
        Appodeal.hideBanner()
        let nativeVC = NativeViewController()
        nativeVC.nativeArray = nativeArray
        self.present(nativeVC, animated: true)
    }
    
    
//MARK: - Other metods
    
    private func showBanner() {
        if bannerCount < Constants.maxViewedBanners {
            Appodeal.showAd(.bannerTop, rootViewController: self)
        }
    }
    
    private func updateRewardedVideoButtonState() {
        rewardedVideoButton.isEnabled = rewardedVideoCount < Constants.maxViewedRewardedVideo
    }

    // Timer for interstitials
    private func startInterstitialsTimer() {
        Timer.scheduledTimer(timeInterval: TimeInterval(Constants.timerInterval), target: self, selector: #selector(enabledInterstitialsButton), userInfo: nil, repeats: false)
    }
    
    @objc private func enabledInterstitialsButton() {
        interstitialsButton.isEnabled = true
    }
    
    // Function for add Subiew on the view
    private func addSubviews() {
        view.addSubview(bannersButton)
        view.addSubview(interstitialsButton)
        view.addSubview(rewardedVideoButton)
        view.addSubview(nativeButton)
    }
    
    // Function for add Appodeal delegate
    private func addAppodealDelegate() {
        Appodeal.setBannerDelegate(self)
        Appodeal.setRewardedVideoDelegate(self)
        Appodeal.setInterstitialDelegate(self)
    }
    
//MARK: Constraints
    
    private func addConstraints() {
        
        bannersButton.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Constants.sideInset)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }
        
        interstitialsButton.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Constants.sideInset)
            $0.top.equalTo(bannersButton.snp.bottom).offset(Constants.buttonOffset)
        }
        
        rewardedVideoButton.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Constants.sideInset)
            $0.top.equalTo(interstitialsButton.snp.bottom).offset(Constants.buttonOffset)
        }
        
        nativeButton.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Constants.sideInset)
            $0.top.equalTo(rewardedVideoButton.snp.bottom).offset(Constants.buttonOffset)
        }
    }
}

//MARK: - Extension for ViewController



//MARK: AppodealBannerDelegate

extension MainViewController: AppodealBannerDelegate {
    func bannerDidShow() {
        bannerCount += 1
        guard bannerCount == Constants.maxViewedBanners else {
            bannersButton.isEnabled = false
            return
        }
        Appodeal.hideBanner()
    }
}

//MARK: AppodealInterstitialDelegate

extension MainViewController: AppodealInterstitialDelegate {
    
    func interstitialDidDismiss() {
        startInterstitialsTimer()
        showBanner()
    }
    
}

//MARK: AppodealRewardedVideoDelegate

extension MainViewController: AppodealRewardedVideoDelegate {
    
    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {
        updateRewardedVideoButtonState()
    }
    
    func rewardedVideoDidPresent() {
        rewardedVideoCount += 1
        updateRewardedVideoButtonState()
        showBanner()
    }
}

//MARK: a

extension MainViewController: APDNativeAdQueueDelegate, APDNativeAdPresentationDelegate {
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {
        if nativeArray.count > 4 {
            return
        } else {
            nativeArray.append(contentsOf: adQueue.getNativeAds(ofCount: 1))
            nativeArray.map{( $0.delegate = self )}
            nativeButton.isEnabled = nativeArray.count >= Constants.maxNativeCell
        }
    }
}
