### Harness FF Sample iOS Swift Application

This is an example Swift application that uses the [iOS SDK for Harness Feature Flags](https://github.com/harness/ff-ios-client-sdk).

This application will demonstrate the following:
- Connects to the Harness Feature Flags service via the CfClient
- Creates an Event Stream to get updates from the Cloud service
- Queries a Multivariate String feature flag and prints the value to the screen. This value will update if a change is made on the Harness Feature Flags dashboard.


##### Requirements
- [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) installed
- Cocoapods
```shell
gem install cocoapods
```


##### Setup Instructions
1. Ensure you have a Harness Feature Flags project and environment set up.
2. Generate a Client SDK Key
3. Add the newly generated Client SDK Key to [FeatureFlagsHelper.swift](ff-ios-sample/FeatureFlagsHelper.swift)
```swift
    private let apiKey = "enter client sdk key here"
```

For more information, refer to the [Getting Started Guide](https://docs.harness.io/article/0a2u2ppp8s-getting-started-with-feature-flags#getting_started)


##### Build instructions
1. Install dependencies via Cocoapods
```shell
pod install
```
2. Open `ff-ios-sample.xcworkspace` in Xcode
3. Copy the feature flag key from your Harness Feature Flags Environment and set `apiKey` in `FeatureFlagsHelper.swift`
4. Run your application through Xcode.

