

import UIKit

class setVC: UIViewController {

    
    @IBAction func onPr(_ sender: Any) {
        let vc = WebViewControler()
        vc.urlString = UserDefaultsManagisi.shared.getURLaFromString(key: "app_privacy_policy_url")
        DispatchQueue.main.async {
            vc.start()
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onTerm(_ sender: Any) {
        let vc = WebViewControler()
        vc.urlString = UserDefaultsManagisi.shared.getURLaFromString(key: "app_terms_of_use_url")
        DispatchQueue.main.async {
            vc.start()
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSup(_ sender: Any) {
        let vc = WebViewControler()
        vc.urlString = UserDefaultsManagisi.shared.getURLaFromString(key: "app_developer_url")
        DispatchQueue.main.async {
            vc.start()
        }
        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
