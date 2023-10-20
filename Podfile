platform :ios, '13.0'
workspace 'TestTaskAppodeal.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
   pod 'Appodeal', '3.2.0-beta.1'
    pod 'APDAdColonyAdapter', '3.2.0.0-beta.1'
    pod 'BidMachineAdColonyAdapter', '~> 2.3.0'
    pod 'APDAppLovinAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterAppLovin', '~> 0.4'
    pod 'APDBidMachineAdapter', '3.2.0.0-beta.1' # Required
    pod 'BidMachineAmazonAdapter', '~> 2.3.0'
    pod 'BidMachineCriteoAdapter', '~> 2.3.0'
    pod 'BidMachineSmaatoAdapter', '~> 2.3.0'
    pod 'BidMachineTapjoyAdapter', '~> 2.3.0'
    pod 'BidMachinePangleAdapter', '~> 2.3.0'
    pod 'APDBidonAdapter', '3.2.0.0-beta.1' # Required
    pod 'BidonAdapterBidMachine', '~> 0.4'
    pod 'APDBigoAdsAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterBigoAds', '~> 0.4'
    pod 'APDDTExchangeAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterDTExchange', '~> 0.4'
    pod 'APDGoogleAdMobAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterGoogleMobileAds', '~> 0.4'
    pod 'APDIABAdapter', '3.2.0.0-beta.1' # Required
    pod 'APDInMobiAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterInMobi', '~> 0.4'
    pod 'APDIronSourceAdapter', '3.2.0.0-beta.1'
    pod 'APDMetaAudienceNetworkAdapter', '3.2.0.0-beta.1'
    pod 'BidMachineMetaAudienceAdapter', '~> 2.3.0'
    pod 'BidonAdapterMetaAudienceNetwork', '~> 0.4'
    pod 'APDMintegralAdapter', '3.2.0.0-beta.1'
    pod 'BidMachineMintegralAdapter', '~> 2.3.0'
    pod 'BidonAdapterMintegral', '~> 0.4'
    pod 'APDMyTargetAdapter', '3.2.0.0-beta.1'
    pod 'BidMachineMyTargetAdapter', '~> 2.3.0'
    pod 'APDStackAnalyticsAdapter', '3.2.0.0-beta.1' # Deprecated
    pod 'APDStackCrashReporterAdapter', '3.2.0.0-beta.1'
    pod 'APDUnityAdapter', '3.2.0.0-beta.1'
    pod 'BidonAdapterUnityAds', '~> 0.4'
    pod 'APDVungleAdapter', '3.2.0.0-beta.1'
    pod 'BidMachineVungleAdapter', '~> 2.3.0'
    pod 'BidonAdapterVungle', '~> 0.4'
    pod 'APDYandexAdapter', '3.2.0.0-beta.1'
end

target 'TestTaskAppodeal' do
  project 'TestTaskAppodeal.xcodeproj'

  appodeal

end

post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
          File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
          end
      end
  end
