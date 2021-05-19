//
//  ViewController.swift
//  dogBreeds
//
//  Created by harsh yadav on 25/01/21.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    var arrData = [jsonModel]()
    
    @IBOutlet weak var tabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    // MARK : create a function for Get API data.
    
    func getData(){
        let url = URL(string: "https://api.thedogapi.com/v1/breeds")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                if error == nil{
                    self.arrData =  try JSONDecoder().decode([jsonModel].self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.tabelview.reloadData()
                    }
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tabelview.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.name.text = " Breed Name :  \(arrData[indexPath.row].name!)"
        cell.imageview.kf.setImage(with: URL(string: arrData[indexPath.row].image.url))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVc = self.storyboard?.instantiateViewController(identifier: "DetailedViewController") as! DetailedViewController
        secondVc.strName = arrData[indexPath.row].name ?? "unKnown"
        secondVc.strLifeSpan = arrData[indexPath.row].life_span ?? "unknown"
        secondVc.strOrigin = arrData[indexPath.row].origin ?? "unknown"
        secondVc.strBreed = arrData[indexPath.row].bred_for ?? "unknown"
        secondVc.strTemperament = arrData[indexPath.row].temperament ?? "unknown"
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

