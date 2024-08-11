//
//  CookieShopViewController.swift
//  DelegatePattern
//
//  Created by Kevin Abram on 08/08/24.
//

import UIKit

class CookieShopViewController: UIViewController {
    
    var cookies: [Cookie] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BakeryViewController") as! BakeryViewController
        vc.delegate = self
        present(vc, animated: true)
        
        // Do this for push navigation
        // navigationController?.pushViewController(DoughMakerViewController(), animated: true)
    }
    
    func makeCookie(cookie: Cookie) {
        cookies.append(cookie)
        tableView.reloadData()
    }
}

extension CookieShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        let cookie = cookies[indexPath.row]
        tableViewCell.textLabel?.text = "\(cookie.name) cookie made with size \(cookie.size)"
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookies.count
    }
}

extension CookieShopViewController: BakeryViewControllerDelegate {
    func orderCookie(cookie: Cookie) {
        makeCookie(cookie: cookie)
    }
}
