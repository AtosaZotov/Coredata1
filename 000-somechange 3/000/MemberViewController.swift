import Foundation
import UIKit

class MemberViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    var member: ConfigItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = member?.a

    }
    
    override func viewDidLayoutSubviews() {
        nameLbl.frame = CGRect(x: 10, y: (view.bounds.height-200)/2, width: view.bounds.width, height: 200)
    }
}
