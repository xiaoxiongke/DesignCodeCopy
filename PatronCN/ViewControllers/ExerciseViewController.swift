//
//  ExerciseViewController.swift
//  PatronCN
//
//  Created by eorin on 2018/4/28.
//  Copyright © 2018年 Guangdong convensiun technology co.,LTD. All rights reserved.
//

import UIKit

class ExerciseViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 600

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension ExerciseViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesCell.identifier) as! ExercisesCell
        return cell
    }
}
