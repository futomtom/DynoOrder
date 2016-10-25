//
//  SideMenuTableView.swift
//  SideMenu
//
//  Created by Jon Kent on 4/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SideMenu

struct menuItem {
    var name:String!
    var segueID:String!
}


class LeftMenuTableView: UITableViewController {
    var  MenuItems = [ menuItem(name:"order",segueID:"order"), menuItem(name:"Summary",segueID:"summary") ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
      //  return  order.itemList.count ?? 0
      
       return MenuItems.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemDetailCell
        
        cell.textLabel?.text = MenuItems[indexPath.row].name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: MenuItems[indexPath.row].segueID, sender: nil)
    }
    
    
    

    
}
