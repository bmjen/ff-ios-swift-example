import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var featureFlagLabel: UILabel!

    // Enter your feature flag name here.
    private let featureFlagName = "teststringvariation"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeatureFlagsHelper.app.initClient() { initialized in
            if(initialized == true) {
                self.checkFeatureValue()
            }
        }

        checkFeatureValue()
    }

    private func checkFeatureValue() {
        FeatureFlagsHelper.app.stringVariation(evaluationId: featureFlagName, defaultValue: "none", onCompletion: { string in
            self.updateLabel(value: string)
        })
    }

    private func updateLabel(value: String) {
        featureFlagLabel.text = "\(featureFlagName): \(value)"
    }

    @IBAction func destroy(_ sender: Any) {
        FeatureFlagsHelper.app.destroy()
    }
}
