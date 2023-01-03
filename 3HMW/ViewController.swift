//
//  ViewController.swift
//  3HMW
//
//  Created by 지구9 on 3/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var adress = Adress(adress: " CHINA", cost:  1000)
    var adress2 = Adress(adress: " USA", cost:  500)
    var adress3 = Adress(adress: " KG", cost:  780)
    var adress4 = Adress(adress: " RU", cost:  1600)
    var adress5 = Adress(adress: " KZ", cost:  890)
    

    
    var addButton = UIButton()
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "adress_name")
        
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 80 / 2
        addButton.setTitle("TAB", for: .normal)
        addButton.backgroundColor = .brown
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        addButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true

        
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    
            
    }
    @objc func addButtonTap(){
        var adresses = [adress , adress2, adress3 , adress4 , adress5]
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.info = "TOTAL PRICE - \((adresses[0].cost) + (adresses[1].cost) + (adresses[2].cost + (adresses[3].cost) + (adresses[4].cost)))"
        self.navigationController?.pushViewController(secondVC, animated: true)
        tableView.reloadData()
        
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var adresses = [adress, adress2, adress3, adress4 , adress5]
       //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "adress_name", for: indexPath)
         cell.textLabel?.text = "adress\(adresses[indexPath.row].adress) cost\(adresses[indexPath.row].cost)"
        return cell
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

class Adress{
    var adress:String
    var cost: Int
 
    init(adress: String , cost: Int){
    self.adress = adress
        self.cost = cost
    }
    }



