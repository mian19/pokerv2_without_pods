

import UIKit

class ExVC: UIViewController {

    @IBAction func home(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var round = 1
    var asks = [Ask]()
    var corrects = 0
    var current = 0
    
    @IBOutlet weak var askLabel: UILabel!
    

    @IBOutlet weak var ans1: UIButton!
    
    @IBOutlet weak var ans2: UIButton!
    
    @IBOutlet weak var ans3: UIButton!
    
    @IBOutlet weak var ans4: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.titleLabel!.text == asks[current].cor {
            corrects += 1
        }
        if current < 5 {
            askLabel.text = asks[current+1].ask
            ans1.setTitle(asks[current+1].vars[ans1.tag], for: .normal)
            ans1.setImage(UIImage(named: "okAns"), for: .highlighted)
            ans2.setTitle(asks[current+1].vars[ans2.tag], for: .normal)
            ans2.setImage(UIImage(named: "okAns"), for: .highlighted)
            ans3.setTitle(asks[current+1].vars[ans3.tag], for: .normal)
            ans3.setImage(UIImage(named: "okAns"), for: .highlighted)
            ans4.setTitle(asks[current+1].vars[ans4.tag], for: .normal)
            ans4.setImage(UIImage(named: "okAns"), for: .highlighted)
        }
            current += 1
         if current == 6 {
            if corrects == 6 {
                let storyboard = UIStoryboard(name: "doneVC", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "doneVC")
                if let vc = vc as? doneVC {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        vc.im.image = UIImage(named: "pass")
                        vc.textis.text = "You pass!"
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                let storyboard = UIStoryboard(name: "doneVC", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "doneVC")
                if let vc = vc as? doneVC {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        vc.im.image = UIImage(named: "nepass")
                        vc.textis.text = "You didn't pass!"
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
       
    }
    
    
    
    override func loadView() {
        super.loadView()
        ans1.tag = 0
        ans2.tag = 1
        ans3.tag = 2
        ans4.tag = 3
        
        switch round {
        case 1:
        asks = [Ask(ask: "three of hearts, four of diamonds, five of diamonds, six of spades, seven of diamonds", vars: ["flush",
                    "straight",
                    "straight flush",
                    "three of a kind"], cor:  "straight"),
                Ask(ask: "five of hearts, six of hearts, seven of hearts, nine of hearts, eight of hearts", vars: ["flush",
                            "straight",
                            "straight flush",
                            "4 of a kind"], cor:  "straight flush"),
                Ask(ask: "six of clubs, two of clubs, four of clubs, jack of spades, two of hearts", vars: ["1 pair",
                            "2 pair",
                            "3 of a kind",
                            "high card"], cor:  "1 pair"),
                Ask(ask: "Which hand would win in poker", vars: ["3 of a kind",
                            "2 pair",
                            "full house",
                            "straight"], cor:  "full house"),
                Ask(ask: "Which hand would win in poker?", vars: ["flush",
                            "straight",
                            "full house",
                            "four of a kind"], cor:  "four of a kind"),
                Ask(ask: "What is the highest ranking hand in poker?", vars: ["straight",
                            "royal flush",
                            "straight flush",
                            "full house"], cor:  "royal flush")]
        case 2:
            asks =  [Ask(ask: "Which hand would win in poker?", vars: ["4 of a kind",
                        "2 pair",
                        "full house",
                        "straight flush"], cor:  "straight flush"),
                    Ask(ask: "3 sevens and 2 spades that are different numbers", vars: ["3 of a kind",
                                "full house",
                                "flush",
                                "2 pair"], cor:  "3 of a kind"),
                    Ask(ask: "6 of diamonds, 2 of clubs, king of diamonds, 2 of diamonds, king of hearts", vars: ["1 pair",
                                "2 pair",
                                "3 of a kind",
                                "high card"], cor:  "2 pair"),
                    Ask(ask: "4 eights and 1 ten", vars: ["flush",
                                "1 pair",
                                "high card",
                                "4 of a kind"], cor:  "4 of a kind"),
                    Ask(ask: "4 of diamonds, 3 of spades, 6 of clubs, 7 of hearts, 5 of clubs", vars: ["straight",
                                "1 pair",
                                "high card",
                                "flush"], cor:  "straight"),
             Ask(ask: "five of hearts, six of hearts, seven of hearts, nine of hearts, eight of hearts", vars: ["flush",
                         "straight",
                         "straight flush",
                         "4 of a kind"], cor:  "straight flush") ]
            
        default:
            asks =   [Ask(ask: "6 of diamonds, 2 of clubs, king of diamonds, 2 of diamonds, king of hearts", vars: ["1 pair",
                        "2 pair",
                        "3 of a kind",
                        "high card"], cor:  "2 pair"),
            Ask(ask: "4 eights and 1 ten", vars: ["flush",
                        "1 pair",
                        "high card",
                        "4 of a kind"], cor:  "4 of a kind"),
            Ask(ask: "4 of diamonds, 3 of spades, 6 of clubs, 7 of hearts, 5 of clubs", vars: ["straight",
                        "1 pair",
                        "high card",
                        "flush"], cor:  "straight"),
Ask(ask: "Which hand would win in poker", vars: ["3 of a kind",
            "2 pair",
            "full house",
            "straight"], cor:  "full house"),
Ask(ask: "Which hand would win in poker?", vars: ["flush",
            "straight",
            "full house",
            "four of a kind"], cor:  "four of a kind"),
Ask(ask: "What is the highest ranking hand in poker?", vars: ["straight",
            "royal flush",
            "straight flush",
            "full house"], cor:  "royal flush")]
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askLabel.text = asks[0].ask
        ans1.setTitle(asks[0].vars[ans1.tag], for: .normal)
        ans1.setImage(UIImage(named: "okAns"), for: .highlighted)
        ans2.setTitle(asks[0].vars[ans2.tag], for: .normal)
        ans2.setImage(UIImage(named: "okAns"), for: .highlighted)
        ans3.setTitle(asks[0].vars[ans3.tag], for: .normal)
        ans3.setImage(UIImage(named: "okAns"), for: .highlighted)
        ans4.setTitle(asks[0].vars[ans4.tag], for: .normal)
        ans4.setImage(UIImage(named: "okAns"), for: .highlighted)
    }
    

   

}

struct Ask {
    var ask: String
    var vars: [String]
    var cor: String
}
