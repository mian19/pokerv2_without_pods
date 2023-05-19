
import UIKit

class ProjectTabbar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "EduViewController", bundle: nil)
          let firstVC = storyboard.instantiateViewController(withIdentifier: "EduViewController")
        let storyboard2 = UIStoryboard(name: "InviteViewController", bundle: nil)
          let secondVC = storyboard2.instantiateViewController(withIdentifier: "InviteViewController")
        let storyboard3 = UIStoryboard(name: "TimeViewController", bundle: nil)
          let thirdVC = storyboard3.instantiateViewController(withIdentifier: "TimeViewController")
        let storyboard4 = UIStoryboard(name: "setVC", bundle: nil)
          let fourVC = storyboard4.instantiateViewController(withIdentifier: "setVC")
        
        
        
        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        let thirdNavigationController = UINavigationController(rootViewController: thirdVC)
        let fourthNavigationController = UINavigationController(rootViewController: fourVC)
        firstNavigationController.tabBarItem.image = UIImage(named: "edu")
        firstNavigationController.tabBarItem.selectedImage = UIImage(named: "edus")
        firstNavigationController.tabBarItem.title = "Education"
        secondNavigationController.tabBarItem.image = UIImage(named: "inv")
        secondNavigationController.tabBarItem.selectedImage = UIImage(named: "invs")
        secondNavigationController.tabBarItem.title = "Invite"
        thirdNavigationController.tabBarItem.image = UIImage(named: "tim")
        thirdNavigationController.tabBarItem.selectedImage = UIImage(named: "tims")
        thirdNavigationController.tabBarItem.title = "Timer"
        fourthNavigationController.tabBarItem.image = UIImage(named: "set")
        fourthNavigationController.tabBarItem.selectedImage = UIImage(named: "sets")
        fourthNavigationController.tabBarItem.title = "Settings"
  
        firstNavigationController.navigationBar.isHidden = true
        secondNavigationController.navigationBar.isHidden = true
        thirdNavigationController.navigationBar.isHidden = true
        fourthNavigationController.navigationBar.isHidden = true
        
        viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController]
   
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.3686, green: 0.4118, blue: 0.7451, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor(red: 0.4157, green: 0.3529, blue: 0.902, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

        UITabBar.appearance().backgroundColor = UIColor(red: 0.054, green: 0.13, blue: 0.354, alpha: 1)
        self.tabBar.backgroundColor = UIColor(red: 0.054, green: 0.13, blue: 0.354, alpha: 1)
        self.tabBar.barTintColor =  UIColor(red: 0.0549, green: 0.1294, blue: 0.3529, alpha: 1.0)
    }
    

    
}
