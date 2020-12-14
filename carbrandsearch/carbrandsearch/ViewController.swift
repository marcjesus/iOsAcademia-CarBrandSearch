//
//  ViewController.swift
//  carbrandsearch
//
//  Created by Marc Jesus on 14/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchtxt: UITextField!
    
    @IBOutlet weak var brandname: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var founderlbl: UILabel!
    @IBOutlet weak var countrylbl: UILabel!
    
    
    private var filename = "autobrands.json"
    
    @IBAction func searchbtn(_ sender: Any) {
        loadbrands()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func loadbrands()
    {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {return}
        
        do{
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
            
            guard let array = json as? [Any] else {return}
            
            for brand in array{
                guard let brands = brand as? [String:Any] else {return}
                guard let name = brands["Name"] as? String else {return}
                guard let age = brands["Founded"] as? Int else {return}
                guard let founder = brands["Founder"] as? String else {return}
                guard let country = brands["Country"] as? String else {return}
                
                if searchtxt.text!.contains(name){
                    brandname.text = name
                    year.text = String(age)
                    founderlbl.text = founder
                    countrylbl.text = country
                    
                }
                
                
            }
            
            
            
        } catch {
            print(error)
        }
        
        
        
        
    }

}

