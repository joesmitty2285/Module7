import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var carBrand: CarBrand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let carBrand = carBrand {
            nameLabel.text = carBrand.name
            detailsLabel.text = carBrand.details
        }
    }
}
