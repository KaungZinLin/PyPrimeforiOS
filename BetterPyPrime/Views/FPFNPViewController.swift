import UIKit

class FPFNPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var startRangeOutlet: UITextField!
    
    @IBOutlet weak var endRangeOutletReal: UITextField!
    
    @IBAction func endRangeOutlet(_ sender: Any) {
        // Created by Mistake
    }
    
    @IBAction func findPrimePressed(_ sender: UIButton) {
        do {
            guard let startText = startRangeOutlet.text,
                  let endText = endRangeOutletReal.text,
                  let start = try parseInput(startText),
                  let end = try parseInput(endText) else {
                return
            }
            
            var primes = [Int]()
            
            if end > 1_000_000 {
                showAlert(title: "Error!", message: "Error: The input mustn't be larger than 1000000!")
            } else if start <= 0 {
                showAlert(title: "Error!", message: "Error: The input must be greater than 0!")
            } else {
                for num in start...end {
                    if num > 1 {
                        var isPrime = true
                        for i in 2...Int(sqrt(Double(num))) {
                            if num % i == 0 {
                                isPrime = false
                                break
                            }
                        }
                        if isPrime {
                            primes.append(num)
                        }
                    }
                }
                
                let primeString = primes.map { String($0) }.joined(separator: ", ")
                showAlert(title: "Results", message: "Here are all the prime numbers:\n" + primeString)
            }
        } catch {
            showAlert(title: "Error!", message: "Invalid input. Please enter a valid positive integer.")
        }
    }
    
    @IBAction func findNonPrimePressed(_ sender: UIButton) {
        do {
            guard let startText = startRangeOutlet.text,
                  let endText = endRangeOutletReal.text,
                  let start = try parseInput(startText),
                  let end = try parseInput(endText) else {
                return
            }
            
            var nonPrimes = [Int]()
            
            for num in start..<end {
                for i in 2..<num {
                    if num % i == 0 {
                        nonPrimes.append(num)
                        break
                    }
                }
            }
            
            let nonPrimeString = nonPrimes.map { String($0) }.joined(separator: ", ")
            showAlert(title: "Results", message: "Here are all the non-prime numbers: " + nonPrimeString)
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
}
