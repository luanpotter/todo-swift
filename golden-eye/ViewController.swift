//
//  ViewController.swift
//  golden-eye
//
//  Created by Luan Nico on 05/08/17.
//  Copyright © 2017 Luan Nico. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var table: UITableView!

    var items = [String]() {
        didSet {
            table.reloadData()
        }
    }
    
    @IBAction func click(_ sender: Any) {
        if let str = txt.text {
            items.append(str)
            txt.text = ""
            txt.becomeFirstResponder()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        txt.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            items.remove(at: indexPath.row)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        click(textField)
        return true
    }
}

