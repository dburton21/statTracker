//
//  ViewController.swift
//  BasketballTracker
//
//  Created by david burton on 4/25/20.
//  Copyright © 2020 Burton inc. All rights reserved.
//

import UIKit

import SQLite3


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
        var shotPercentage = float_t()
        
        init(assists: integer_t, steals: integer_t, turnovers: integer_t, rebounds: integer_t, charges: integer_t, numerator: integer_t, denominator: integer_t, shotPercentage: float_t){
            
            self.assists = assists
            self.steals = steals
            self.turnovers = turnovers
            self.rebounds = rebounds
            self.charges = charges
            self.numerator = numerator
            self.denominator = denominator
            self.shotPercentage = shotPercentage
            
        }
        
    }
    
    let david  = player(assists: 0, steals: 0, turnovers: 0, rebounds: 0, charges: 0, numerator: 0, denominator: 0, shotPercentage: 0)
    let teddy = player(assists: 0, steals: 0, turnovers: 0, rebounds: 0, charges: 0, numerator: 0, denominator: 0, shotPercentage: 0)
    
    //teddy here now
    override func viewDidLoad() {
        super.viewDidLoad()
        //        circularButton?.mybg(_bg:.red)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func halfTimeButton(_ sender: Any) {
        teddy.shotPercentage = float_t(teddy.numerator/teddy.denominator)
        
        
        var db: OpaquePointer?
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("BasketballStats.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error opening database.")
            return
        }
        
//        let createTableQuery = "CREATE TABLE statsh (id INTEGER PRIMARY KEY, name TEXT, threesMade INTEGER, threestaken INTEGER, threepercent INTEGER, twosmade INTEGER, twostaken INTEGER, twopercent INTEGER, freemade INTEGER, freetaken INTEGER, freepercent INTEGER, stls INTEGER, rebs INTEGER, blks INTEGER, asts INTEGER, turno INTEGER, chg INTEGER, rate INTEGER)"
//
//        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
//            print("Error creating table.")
//            return
//        }
//
//        print("Table created.")
//
        
        
        let insertTableQuery = "INSERT INTO statsh (id, twosmade, twostaken, twopercent, stls, rebs, asts, turno, chg) VALUES (2, \(teddy.numerator), \(teddy.denominator), \(teddy.shotPercentage), \(teddy.steals), \(teddy.rebounds), \(teddy.assists), \(teddy.turnovers), \(teddy.charges))"
        
        if sqlite3_exec(db, insertTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error inserting item.")
            return
        }
        
        print("Item inserted.")
        
        let selectTableQuery = "SELECT twosmade FROM statsh WHERE id = 2"
        let selectTableQuerya = "SELECT twostaken FROM statsh WHERE id = 2"
        let selectTableQueryb = "SELECT stls FROM statsh WHERE id = 2"
        let selectTableQueryc = "SELECT rebs FROM statsh WHERE id = 2"
        let selectTableQuerye = "SELECT asts FROM statsh WHERE id = 2"
        let selectTableQueryf = "SELECT turno FROM statsh WHERE id = 2"
        let selectTableQueryg = "SELECT chg FROM statsh WHERE id = 2"
        let selectTableQueryh = "SELECT twopercent FROM statsh WHERE id = 2"
        
        
        var queryStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQuery, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let twosmade = sqlite3_column_int(queryStatement, 0)
                print("Teddy's shot makes: \(twosmade)")
            }
        }
        
        var queryStatementa: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQuerya, -1, &queryStatementa, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementa) == SQLITE_ROW {
                let twostaken = sqlite3_column_int(queryStatementa, 0)
                print("Teddy's shot attempts: \(twostaken)")
            }
        }
        var queryStatementh: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQueryh, -1, &queryStatementh, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementh) == SQLITE_ROW {
                let shotPercent = sqlite3_column_int(queryStatementh, 0)
                print("Teddy's field goal percentage: \(shotPercent)")
            }
        }
        
        
        var queryStatementb: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQueryb, -1, &queryStatementb, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementb) == SQLITE_ROW {
                let steals = sqlite3_column_int(queryStatementb, 0)
                print("Teddy's steals: \(steals)")
            }
        }
        
        var queryStatementc: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQueryc, -1, &queryStatementc, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementc) == SQLITE_ROW {
                let rebounds = sqlite3_column_int(queryStatementc, 0)
                print("Teddy's rebounds: \(rebounds)")
            }
        }
        
        var queryStatemente: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQuerye, -1, &queryStatemente, nil) == SQLITE_OK {
            if sqlite3_step(queryStatemente) == SQLITE_ROW {
                let assists = sqlite3_column_int(queryStatemente, 0)
                print("Teddy's assists: \(assists)")
            }
        }
        
        var queryStatementf: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQueryf, -1, &queryStatementf, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementf) == SQLITE_ROW {
                let turnovers = sqlite3_column_int(queryStatementf, 0)
                print("Teddy's turnovers: \(turnovers)")
            }
        }
        
        var queryStatementg: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQueryg, -1, &queryStatementg, nil) == SQLITE_OK {
            if sqlite3_step(queryStatementg) == SQLITE_ROW {
                let charges = sqlite3_column_int(queryStatementg, 0)
                print("Teddy's charges: \(charges)")
            }
        }
        
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


