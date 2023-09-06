import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = Design.Color.gray
        self.tabBar.tintColor = Design.Color.black
        self.tabBar.backgroundColor = Design.Color.white
    }
}
