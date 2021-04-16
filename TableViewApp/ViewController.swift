//
//  ViewController.swift
//  TableViewApp
//
//  Created by Sidarth V on 11/04/21.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var events = ["Enigma", "OpenCon", "CTF", "Palette"]
    var urls = ["https://enigma.ieeevit.org/", "https://opencon.ieeevit.org/", "https://ctf.ieeevit.org/", "https://palette.ieeevit.org/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 208
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: urls[indexPath.row]) else {
            return
        }
        let vc = WebViewController(url: url, title: events[indexPath.row])
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = events[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        cell.imageView?.image = UIImage(named: events[indexPath.row])
        return cell
    }
}
