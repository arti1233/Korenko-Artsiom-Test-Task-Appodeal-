platform :ios, '12.0'
workspace 'TestTaskAppodeal.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'Appodeal', '3.1.3'
    pod 'APDAdColonyAdapter', '3.1.3.0'
    pod 'BidMachineAdColonyAdapter', '~> 2.3.0.0'
    pod 'APDAppLovinAdapter', '3.1.3.0'
    pod 'APDBidMachineAdapter', '3.1.3.0' # Required
    pod 'BidMachineMintegralAdapter', '~> 2.3.0.0'
    pod 'BidMachineAmazonAdapter', '~> 2.3.0.0'
    pod 'BidMachineCriteoAdapter', '~> 2.3.0.0'
    pod 'BidMachineSmaatoAdapter', '~> 2.3.0.0'
    pod 'BidMachineTapjoyAdapter', '~> 2.3.0.0'
    pod 'BidMachinePangleAdapter', '~> 2.3.0.0'
    pod 'APDGoogleAdMobAdapter', '3.1.3.0'
    pod 'APDIABAdapter', '3.1.3.0' # Required
    pod 'APDIronSourceAdapter', '3.1.3.0'
    pod 'APDMetaAudienceNetworkAdapter', '3.1.3.0'
    pod 'BidMachineMetaAudienceAdapter', '~> 2.3.0.0'
    pod 'APDMyTargetAdapter', '3.1.3.0'
    pod 'BidMachineMyTargetAdapter', '~> 2.3.0.0'
    pod 'APDStackAnalyticsAdapter', '3.1.3.0' # Required
    pod 'APDUnityAdapter', '3.1.3.0'
    pod 'APDVungleAdapter', '3.1.3.0'
    pod 'BidMachineVungleAdapter', '~> 2.3.0.0'
    pod 'APDYandexAdapter', '3.1.3.0'
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
