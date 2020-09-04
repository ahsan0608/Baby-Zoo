//
//  ViewController.swift
//  Baby Zoo
//
//  Created by Ahsan on 9/2/20.
//  Copyright © 2020 Ahsan.fish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listOfKillerAnimals = [Animal]()
    var listOfNotKillerAnimals = [Animal]()
    var AnimalType = ["Not killer", "Killer"]
    
    @IBOutlet var tvListAnimals: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfNotKillerAnimals.append(Animal(name: "Baboon", des: "Baboons are primates comprising the genus Papio....", image: "baboon"))
        listOfKillerAnimals.append(Animal(name: "Bulldog", des: "Bulldog live in  big place with tree....", image: "bulldog"))
        listOfNotKillerAnimals.append(Animal(name: "Panda", des: "The giant panda, also known as the panda bear or simply the panda....", image: "panda"))
        listOfNotKillerAnimals.append(Animal(name: "Swallow bird", des: "Swallow bird live in  big place with tree....", image: "swallow_bird"))
        listOfKillerAnimals.append(Animal(name: "White tiger", des: "The white tiger or bleached tiger is a pigmentation variant of the Bengal tiger....", image: "white_tiger"))
        listOfNotKillerAnimals.append(Animal(name: "Zebra", des: "Zebras are African equines with distinctive black and white striped coats....", image: "zebra"))
        
        tvListAnimals.delegate = self
        tvListAnimals.dataSource = self
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AnimalType[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return listOfNotKillerAnimals.count
        }else{
            return  listOfKillerAnimals.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal:TVCAnimal = tableView.dequeueReusableCell(withIdentifier: "cellAnimal", for: indexPath) as! TVCAnimal
        if indexPath.section == 0 {
         cellAnimal.SetAnimal(animal: listOfNotKillerAnimals[indexPath.row])
        }else{
           cellAnimal.SetAnimal(animal: listOfKillerAnimals[indexPath.row])
        }
        
        return cellAnimal
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0 {
              print(listOfNotKillerAnimals[indexPath.row].image!)
            listOfNotKillerAnimals.remove(at: indexPath.row)
           // listOfNotKillerAnimals.append(listOfNotKillerAnimals[indexPath.row])
        }else{
            print(listOfKillerAnimals[indexPath.row].name!)
            listOfKillerAnimals.remove(at: indexPath.row)
           //listOfKillerAnimals.append(listOfKillerAnimals[indexPath.row])
        }
        
        tvListAnimals.reloadData()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

