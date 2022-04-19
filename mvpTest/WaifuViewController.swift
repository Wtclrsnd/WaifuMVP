//
//  ViewController.swift
//  mvpTest
//
//  Created by Emil Shpeklord on 19.04.2022.
//

import UIKit

final class WaifuViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var waifuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("New Waifu", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    private func setUpUI() {

    }

}

