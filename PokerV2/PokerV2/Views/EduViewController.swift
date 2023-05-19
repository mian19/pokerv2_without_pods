

import UIKit

class EduViewController: UIViewController {

    
    @IBAction func exam(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ExVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ExVC")
        if let vc = vc as? ExVC {
            vc.round = 1
        }
        self.navigationController?.pushViewController(vc, animated: true)
  
    }
    
    
    @IBAction func q1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ExVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ExVC")
        if let vc = vc as? ExVC {
            vc.round = 2
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func q2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ExVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ExVC")
        if let vc = vc as? ExVC {
            vc.round = 3
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func art1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "readVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "readVC")
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func art2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "readVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "readVC")
        if let vc = vc as? readVC {
            vc.sec = 2
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
