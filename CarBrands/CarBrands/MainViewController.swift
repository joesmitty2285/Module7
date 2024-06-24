import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let carBrands = [
            CarBrand(name: "Ford", details: "Ford Motor Company\nHeadquarters: Dearborn, Michigan, USA\nWebsite: https://www.ford.com"),
            CarBrand(name: "Chevrolet", details: "Chevrolet, colloquially referred to as Chevy\nHeadquarters: Detroit, Michigan, USA\nWebsite: https://www.chevrolet.com"),
            CarBrand(name: "Toyota", details: "Toyota Motor Corporation\nHeadquarters: Toyota City, Aichi, Japan\nWebsite: https://www.toyota.com"),
            CarBrand(name: "Honda", details: "Honda Motor Co., Ltd.\nHeadquarters: Tokyo, Japan\nWebsite: https://www.honda.com"),
            CarBrand(name: "Nissan", details: "Nissan Motor Co., Ltd.\nHeadquarters: Yokohama, Kanagawa, Japan\nWebsite: https://www.nissan-global.com"),
            CarBrand(name: "Jeep", details: "Jeep is a brand of American automobiles\nHeadquarters: Toledo, Ohio, USA\nWebsite: https://www.jeep.com"),
            CarBrand(name: "Tesla", details: "Tesla, Inc. is an American electric vehicle company\nHeadquarters: Palo Alto, California, USA\nWebsite: https://www.tesla.com"),
            CarBrand(name: "BMW", details: "Bayerische Motoren Werke AG\nHeadquarters: Munich, Germany\nWebsite: https://www.bmw.com"),
            CarBrand(name: "Mercedes-Benz", details: "Mercedes-Benz AG is a German global automobile marque\nHeadquarters: Stuttgart, Germany\nWebsite: https://www.mercedes-benz.com"),
            CarBrand(name: "Volkswagen", details: "Volkswagen, shortened to VW, is a German automaker\nHeadquarters: Wolfsburg, Germany\nWebsite: https://www.volkswagen.com")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register the prototype cell programmatically
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CarCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carBrands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        cell.textLabel?.text = carBrands[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: carBrands[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.carBrand = sender as? CarBrand
        }
    }
}
