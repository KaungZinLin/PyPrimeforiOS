import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! // Connect this to your WKWebView in the storyboard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openWebsite(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Handle invalid URL error
            print("Invalid URL: \(urlString)")
        }
    }

    @IBAction func githubButtonPressed(_ sender: UIButton) {
       openWebsite(urlString: "https://github.com/KaungZinLin/PyPrimeiOS")
    }
}
