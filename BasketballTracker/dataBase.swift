//
//  dataBase.swift
//  BasketballTracker
//
//  Created by david burton on 5/19/20.
//  Copyright © 2020 Burton inc. All rights reserved.
//

import Foundation

import UIKit
import SQLite3


class dataBase: UIView {
    
    var db: OpaquePointer?
    
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("BasketballStats.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error opening database.")
            return
        }
        
        let createTableQuery = "CREATE TABLE statsf (id INTEGER PRIMARY KEY, name TEXT, threesMade INTEGER, threestaken INTEGER, threepercent INTEGER, twosmade INTEGER, twostaken INTEGER, twopercent INTEGER, freemade INTEGER, freetaken INTEGER, freepercent INTEGER, stls INTEGER, rebs INTEGER, blks INTEGER, asts INTEGER, turno INTEGER, chg INTEGER, rate INTEGER)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error creating table.")
            return
        }
        
        print("Table created.")
        
        
        
        let insertTableQuery = "INSERT INTO statsf (id, threesMade) VALUES (2, 5)"
        
        if sqlite3_exec(db, insertTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error inserting item.")
            return
        }
        
        print("Item inserted.")
        
        let selectTableQuery = "SELECT threesMade FROM statsf WHERE id = 2"
        
        var queryStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, selectTableQuery, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let threes = sqlite3_column_int(queryStatement, 0)
                print("\(threes)")
            }
        }
        
        
    }

