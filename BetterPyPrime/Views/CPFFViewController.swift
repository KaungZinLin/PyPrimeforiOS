import UIKit

class CPFFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var entryOutlet: UITextField!

    @IBAction func checkPrimePressed(_ sender: UIButton) {
        do {
            if let nText = entryOutlet.text, let n = try parseInput(nText) {
                if n < 2 {
                    showAlert(title: "Results", message: "\(n) is NOT a prime number.")
                } else if n == 3 || n == 2 {
                    showAlert(title: "Results", message: "\(n) is a prime number.")
                } else if n == 4 {
                    showAlert(title: "Results", message: "\(n) is NOT a prime number.")
                } else {
                    var isPrime = true
                    for i in 2...Int(sqrt(Double(n))) {
                        if n % i == 0 {
                            isPrime = false
                            break
                        }
                    }

                    if isPrime {
                        showAlert(title: "Results", message: "\(n) is a prime number.")
                    } else {
                        showAlert(title: "Results", message: "\(n) is NOT a prime number.")
                    }
                }
            }
        } catch {
            showAlert(title: "Error!", message: "Invalid input. Please enter a valid positive integer.")
        }
    }

    @IBAction func findFactorsPressed(_ sender: UIButton) {
        do {
            if let nText = entryOutlet.text, let n = try parseInput(nText) {
                if n <= 0 {
                    showAlert(title: "Error!", message: "Error: The input must be greater than 0!")
                } else if n >= 1_000_000_000 {
                    showAlert(title: "Error!", message: "Error: The input mustn't be larger than 1,000,000,000!")
                } else {
                    var factors = [String]()
                    for i in 1...n {
                        if n % i == 0 {
                            factors.append(String(i))
                        }
                    }
                    let factorString = factors.joined(separator: ", ")
                    showAlert(title: "Results", message: "Here are all the factors of \(n):\n" + factorString)
                }
            }
        } catch {
            showAlert(title: "Error!", message: "Invalid input. Please enter a valid positive integer.")
        }
    }

    // A helper function to display an alert.
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true, completion: nil)
    }

    // A helper function to parse and validate input.
    func parseInput(_ input: String) throws -> Int? {
        guard let n = Int(input), n > 0 else {
            throw NSError(domain: "InvalidInput", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid input. Please enter a valid positive integer."])
        }
        return n
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

