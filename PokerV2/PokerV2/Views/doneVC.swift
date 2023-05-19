
import UIKit

class doneVC: UIViewController {

    @IBOutlet weak var im: UIImageView!
    
    @IBOutlet weak var textis: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func home(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
     
    }
    
}
