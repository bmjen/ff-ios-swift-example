import Foundation
import ff_ios_client_sdk

class FeatureFlagsHelper {
    
    static var app: FeatureFlagsHelper = {
        return FeatureFlagsHelper()
    }()

    private let apiKey = "enter client sdk key here"
    
    func initClient(onCompletion:@escaping(Bool)->()) {
        let configuration = CfConfiguration.builder().setStreamEnabled(true).build()
        let target = CfTarget.builder().setName("ios-test").setIdentifier("ios-test").build()

        CfClient.sharedInstance.initialize(apiKey: apiKey, configuration: configuration, target: target) { (result) in
            switch result {
                    case .failure(let error):
                        print(error.errorData)
                        onCompletion(false)
                    case .success:
                        self.setupStream(){(result) in
                            onCompletion(true)
                        }
                        onCompletion(true)
            }
        }
    }
    
    func setupStream(onCompletion:@escaping(Bool)->()) {
        CfClient.sharedInstance.registerEventsListener() { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                    onCompletion(false)
                case .success(let eventType):
                    switch eventType {
                        case .onPolling:
                            print("Event: Received all evaluation flags")
                        case .onEventListener(let evaluation):
                            print("Event: Received an evaluation flag, \(evaluation!)")
                        case .onComplete:
                            print("Event: SSE stream has completed")
                        case .onOpen:
                            print("Event: SSE stream has been opened")
                        case .onMessage(let messageObj):
                            print(messageObj?.event ?? "Event: Message received")
                    }
                    onCompletion(true)
                }
        }
    }
    
    func stringVariation(evaluationId: String, defaultValue: String, onCompletion:@escaping(String)->()) {
        CfClient.sharedInstance.stringVariation(evaluationId: evaluationId, defaultValue: defaultValue) { (eval) in
            onCompletion(eval!.value.stringValue!)
        }
    }
    
    func destroy() {
        CfClient.sharedInstance.destroy()
    }
    
}
