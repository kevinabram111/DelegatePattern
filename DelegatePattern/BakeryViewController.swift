//
//  BakeryViewController.swift
//  DelegatePattern
//
//  Created by Kevin Abram on 08/08/24.
//

import UIKit

struct Cookie {
    var name: String
    var size: Int
}

protocol BakeryViewControllerDelegate: AnyObject {
    func orderCookie(cookie: Cookie)
}

class BakeryViewController: UIViewController {
    
    weak var delegate: BakeryViewControllerDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOrderCookie(_ sender: UIButton) {
        delegate?.orderCookie(cookie: .init(name: nameTextField.text ?? "", size: Int(sizeTextField.text ?? "0") ?? 0))
    }
}
