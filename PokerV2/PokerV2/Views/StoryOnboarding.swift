
import UIKit
import StoreKit

class StoryOnboarding: UIViewController {

    var pages = [UIViewController]()
   
    @IBOutlet weak var firstIV: UIImageView!
    
    @IBOutlet weak var textL: UILabel!
    @IBOutlet weak var secondIV: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    var labelTexts = ["Invvite your friends to play", "Control games with a timer"]
    
   
    var current = 1
    var isRateShowed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButton(_ sender: UIButton) {
        
        current += 1
        switch current {
        case 2:
            firstIV.image = UIImage(named: "BG_2")
            textL.text = labelTexts[0]
            secondIV.image = UIImage(named: "BG-2")
        case 3:
            firstIV.image = UIImage(named: "BG_3")
            textL.text = labelTexts[1]

            secondIV.image = UIImage(named: "BG-3")

        case 4:
            UserDefaults.standard.set(true, forKey: CheckingTypes.onboardingo.rawValue)
            SKStoreReviewController.requestReview()

          //  let storyboard = UIStoryboard(name: "AppFormViewController", bundle: nil)
        //    let vc = storyboard.instantiateViewController(withIdentifier: "AppFormViewController")
let vc = ProjectTabbar()
            let navController = UINavigationController(rootViewController: vc)
            navController.navigationBar.isHidden = true
            guard let window = UIApplication.shared.windows.first else {
                return
            }
            window.rootViewController = vc
            window.makeKeyAndVisible()
        default:
            break
        }
    }
}
