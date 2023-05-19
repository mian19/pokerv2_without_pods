
import UIKit

class InviteViewController: UIViewController {
    
    
    @IBOutlet weak var textL: UITextField!
    
    @IBOutlet weak var dateL: UITextField!
    
    @IBOutlet weak var timeL: UITextField!
    
    @IBOutlet weak var pl1L: UITextField!
    
    @IBOutlet weak var pl2L: UITextField!
    
    @IBOutlet weak var pl3L: UITextField!
    
    @IBOutlet weak var pl4L: UITextField!
    
    @IBOutlet weak var pl5L: UITextField!
    
    @IBOutlet weak var pl6L: UITextField!
    
    var shareList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        pl1L.tag = 1
        pl2L.tag = 1
        pl3L.tag = 1
        pl4L.tag = 1
        pl5L.tag = 1
        pl6L.tag = 1
        NotificationCenter.default.addObserver(self, selector: #selector(kWillS), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kWillH), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGestureHide = UITapGestureRecognizer(target: self, action: #selector(viewTappedHide))
        view.addGestureRecognizer(tapGestureHide)
        
        self.view.subviews.forEach{
            if let sub = $0 as? UITextField {
                sub.delegate = self
            }
        }
    }
    
    var isShowKeyboard = false
    @objc func kWillS(_ notif: Notification) {
        let userInfo = notif.userInfo
        let keyboardFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let keyboardH = keyboardFrame?.height ?? 100
        if ((view.frame.maxY - pl6L.frame.maxY) < keyboardH) && isShowKeyboard == false {
            isShowKeyboard = true
            
            self.view.frame.origin.y -=  keyboardH - (view.frame.maxY - pl6L.frame.maxY) + 20
        }
    }
    
    @objc func kWillH() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @objc func viewTappedHide() {
        isShowKeyboard = false
        print("tata")
        view.endEditing(true)
        print("tatat")
    }
    
    @IBAction func invite(_ sender: Any) {
        self.view.subviews.forEach{
            if let sub = $0 as? UITextField, sub.tag == 1, sub.text != "" {
                shareList.append(sub.text!)
            }
        }
        let textToShare = """
\(textL.text ?? "Hello")
date: \(dateL.text ?? "tomorrow")
time: \(timeL.text ?? "20:00")
players: \(shareList.joined(separator: ", "))
"""
        
        var itemsToShare: [Any] = [textToShare]
        
        
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [
            .airDrop,
            .addToReadingList
        ]
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.sourceView = sender as! UIView
            popoverPresentationController.sourceRect = (sender as AnyObject).bounds
        }
        present(activityViewController, animated: true, completion: nil)
        
        activityViewController.completionWithItemsHandler = { [weak self] activityType, completed, returnedItems, error in
            guard let self = self else { return }
            
            if completed {
                self.view.subviews.forEach{
                    if let sub = $0 as? UITextField {
                        sub.text = ""
                    }
                }
                let storyboard = UIStoryboard(name: "doneVC", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "doneVC")
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                print("fail")
            }
        }
    }
}


extension InviteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.subviews.forEach{
            if let sub = $0 as? UITextField {
                sub.resignFirstResponder()
            }
        }
        isShowKeyboard = false
        
        return true
    }
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == dateL {
            
            guard let currentText = textField.text else {
                return true
            }
            
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            
            if !isMatchingPattern(updatedText) {
                return false
            }
            
            if string != "" {
                let formattedText = formatText(updatedText)
                textField.text = formattedText
                return false
            }
        }
        return true
    }
    
    func isMatchingPattern(_ text: String) -> Bool {
        let pattern = "^\\d{0,2}(\\.\\d{0,2}(\\.\\d{0,4})?)?$"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: text.count)
        let matches = regex?.numberOfMatches(in: text, options: [], range: range)
        return matches == 1
    }
    
    func formatText(_ text: String) -> String {
        var formattedText = text
        
        if text.count >= 2 && formattedText.range(of: ".", options: [], range: text.index(text.startIndex, offsetBy: 2)..<text.endIndex) == nil {
            let index = text.index(text.startIndex, offsetBy: 2)
            formattedText.insert(".", at: index)
        }
        if text.count >= 5 && formattedText.range(of: ".", options: [], range: text.index(text.startIndex, offsetBy: 5)..<text.endIndex) == nil {
            let index = text.index(text.startIndex, offsetBy: 5)
            formattedText.insert(".", at: index)
        }
        
        return formattedText
    }
}
