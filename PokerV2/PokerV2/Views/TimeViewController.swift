
import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var roundLabel: UILabel!
    var round: Int = 1
    var basicBlind = 25
    @IBOutlet weak var botsp: NSLayoutConstraint!
    
    @IBOutlet weak var cyferBlat: UILabel!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pro: ProgressCircle!
    @IBOutlet weak var blindLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.main.bounds.height <= 670 {
            botsp.constant = 9.0
        }
        view.layoutIfNeeded()
        startButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        againButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showBlainds))
        blindLabel.isUserInteractionEnabled = true
        blindLabel.addGestureRecognizer(tap)
       
    }
    
    var roundTime: TimeInterval = 600
    var interval = 1.0
        var timer: Timer!
    var isPlayRound = false
    var currentRound = 1
    var currentBlaind = 25
var blainds = 8
    
    func pushTimer() {
        isPlayRound = true
        interval = 1.0
        startButton.setTitle("PAUSE", for: .normal)
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            if self?.roundTime == 1 {
                if self!.currentRound < 99  {
                    self?.currentRound += 1
                }
                self!.currentBlaind = self!.currentRound * self!.basicBlind
                self!.roundTime = 600
                DispatchQueue.main.async {
                    self?.roundLabel.text = "Round \(self?.currentRound ?? 1)"
                    if self!.currentBlaind < self!.currentBlaind * self!.blainds  {
                        self!.blindLabel.text = "\(self!.currentBlaind)/\(self!.currentBlaind*2)"
                    }
                }
            }
            
            if self!.roundTime != 1.0 {
                self?.roundTime -= self!.interval
                DispatchQueue.main.async {
                    self?.cyferBlat.text = self?.timeString(time: self?.roundTime ?? 0)
                    self?.pro.progress = (self?.roundTime ?? 0) * 100 / 600 / 100
                }
            }
        }
        }

        func timeString(time: TimeInterval) -> String {
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }

    @objc func playPauseButtonTapped(_ sender: UIButton) {
          if isPlayRound {
              pausePushing()
          } else {
              pushTimer()
          }
      }

    @objc func resetButtonTapped(_ sender: UIButton) {
          resetPushing()
      }
    
    @objc func showBlainds() {
        let alertController = UIAlertController(title: "Choose Blaind", message: nil, preferredStyle: .alert)

        for i in 1...blainds {
            let action = UIAlertAction(title: "\(self.basicBlind*i)/\(self.basicBlind*i*2)", style: .default) { _ in
                // Handle button tap
                self.blindLabel.text = "\(self.basicBlind*i)/\(self.basicBlind*i*2)"
                self.currentBlaind = i * self.basicBlind
            }
            alertController.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

      func pausePushing() {
          timer.invalidate()
          timer = nil
          interval = 0.0
          startButton.setTitle("START", for: .normal)
          isPlayRound = false
      }

      func resetPushing() {
          if let timer = timer {
              timer.invalidate()
          }
          pro.progress = 0
          cyferBlat.text = "10:00"
          startButton.setTitle("START", for: .normal)
          roundLabel.text = "Round 1"
          isPlayRound = false
          roundTime = 600
          currentRound = 1
          currentBlaind = 25
          blindLabel.text = "25/50"

      }



}
