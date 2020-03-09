//
//  DetailViewController.swift
//  UserList
//
//  Created by Manuel Entrena on 09/03/2020.
//  Copyright © 2020 Manuel Entrena. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum Rows: Int, CaseIterable {
        case name
        case email
        case address
        case phone
        case website
        case company
    }
    
    @IBOutlet weak var tableView: UITableView!

    func configureView() {
        // Update the user interface for the detail item.
        tableView?.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: User? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let rowOption = Rows(rawValue: indexPath.row) else { return cell }
        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        switch rowOption {
        case .name:
            cell.textLabel?.text = detailItem?.name
        case .email:
            cell.textLabel?.text = detailItem?.email
        case .address:
            cell.textLabel?.text = detailItem?.address?.street
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
        case .phone:
            cell.textLabel?.text = detailItem?.phone
        case .website:
            cell.textLabel?.text = detailItem?.website
        case .company:
            cell.textLabel?.text = detailItem?.company?.name
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
