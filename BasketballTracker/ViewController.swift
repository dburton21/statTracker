//
//  ViewController.swift
//  BasketballTracker
//
//  Created by david burton on 4/25/20.
//  Copyright © 2020 Burton inc. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    

    var davidClicked = false
    var teddyClicked = false

    class player{
        var assists = integer_t()
        var steals = integer_t()
        var turnovers = integer_t()
        var rebounds = integer_t()
        var charges = integer_t()
        var numerator = integer_t()
        var denominator = integer_t()
        
        init(assists: integer_t, steals: integer_t, turnovers: integer_t, rebounds: integer_t, charges: integer_t, numerator: integer_t, denominator: integer_t){
            
            self.assists = assists
            self.steals = steals
            self.turnovers = turnovers
            self.rebounds = rebounds
            self.charges = charges
            self.numerator = numerator
            self.denominator = denominator
            
        }
        
    }
    
    let david  = player(assists: 0, steals: 0, turnovers: 0, rebounds: 0, charges: 0, numerator: 0, denominator: 0)
    let teddy = player(assists: 0, steals: 0, turnovers: 0, rebounds: 0, charges: 0, numerator: 0, denominator: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        circularButton?.mybg(_bg:.red)
        // Do any additional setup after loading the view, typically from a nib.
        print("It opened...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playerDavid(_ sender: Any) {
        print("David?")
     
        davidClicked = true
        teddyClicked = false

        
    }
    @IBAction func teddyPlayer(_ sender: Any) {
        print("Teddy?")
        
        teddyClicked = true
        davidClicked = false
        
    }
    
    
    @IBOutlet weak var makeMiss: UISegmentedControl!
    
    @IBAction func paintButton(_ sender: Any) {
        if makeMiss.isHidden == false {
        makeMiss.isHidden = true
    makeMiss.selectedSegmentIndex=UISegmentedControlNoSegment
        }
        else {
            makeMiss.isHidden = false
    makeMiss.selectedSegmentIndex=UISegmentedControlNoSegment
        }
    }
    
    @IBAction func makeMissFunction(_ sender: UISegmentedControl) {
        if makeMiss.isHidden == false {
            makeMiss.isHidden = true
            makeMiss.isSelected = false
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            if davidClicked == true{
                david.numerator = david.numerator + 1
                david.denominator = david.denominator + 1
            }
            else if teddyClicked == true {
                teddy.numerator = teddy.numerator + 1
                teddy.denominator = teddy.denominator + 1
                }
            print("David numerator: \(david.numerator)")
            print("David denominator: \(david.denominator)")
            print("Teddy numerator: \(teddy.numerator)")
            print("Teddy denominator: \(teddy.denominator)")
        default:
            if davidClicked == true{
                david.denominator = david.denominator + 1
            }
            else if teddyClicked == true {
                teddy.denominator = teddy.denominator + 1
            }
            print("Teddy numerator: \(teddy.numerator)")
            print("Teddy denominator: \(teddy.denominator)")
            print("David numerator: \(david.numerator)")
            print("David denominator: \(david.denominator)")
        }
        
    }
    
    
    
    

    @IBAction func AssitsButton(_ sender: Any) {
        
        if davidClicked == true{
            david.assists = david.assists + 1
            print("David assist: \(david.assists)")
        }
        else if teddyClicked == true{
            teddy.assists = teddy.assists + 1
            print("Teddy assist: \(teddy.assists)")
        }
        else {
            print("assist button was clicked")
            
        }

    }

    
    @IBAction func reboundsButton(_ sender: Any) {
        if davidClicked == true{
            david.rebounds = david.rebounds + 1
            print("David rebounds: \(david.rebounds)")
        }
        else if teddyClicked == true{
            teddy.rebounds = teddy.rebounds + 1
            print("Teddy rebounds: \(teddy.rebounds)")
        }
        else {
            print("Please pick a player first.")
        }

    }
    
    
    
    @IBAction func turnoversButton(_ sender: Any) {
        if davidClicked == true{
            david.turnovers = david.turnovers + 1
            print("David turnovers: \(david.turnovers)")
        }
        else if teddyClicked == true{
            teddy.turnovers = teddy.turnovers + 1
            print("Teddy turnovers: \(teddy.turnovers)")
        }
        else {
            print("Please pick a player first.")
        }
    }
    
    @IBAction func stealsButton(_ sender: Any) {
        if davidClicked == true{
            david.steals = david.steals + 1
            print("David steals: \(david.steals)")
        }
        else if teddyClicked == true{
            teddy.steals = teddy.steals + 1
            print("Teddy steals: \(teddy.steals)")
        }
        else {
            print("Please pick a player first.")
        }
    }
    
    
    @IBAction func chargesButton(_ sender: Any) {
        if davidClicked == true{
            david.charges = david.charges + 1
            print("David charges: \(david.charges)")
        }
        else if teddyClicked == true{
            teddy.charges = teddy.charges + 1
            print("Teddy charges: \(teddy.charges)")
        }
        else {
            print("Please pick a player first.")
        }
    }
    
}

