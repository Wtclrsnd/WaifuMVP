//
//  ViewController.swift
//  mvpTest
//
//  Created by Emil Shpeklord on 19.04.2022.
//

import UIKit

final class WaifuViewController: UIViewController, WaifuProtocol {

    private var presenter = WaifuPresenter(service: WaifuApiService())

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var waifuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("New Waifu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        presenter.setViewDelegate(waifuDelegate: self)
        presenter.getWaifu()
    }

    @objc func setNewWaifu() {
        presenter.getWaifu()
        print("tap")
    }

    func displayWaifu(waifu: UIImage) {
        imageView.image = waifu
    }
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(waifuButton)

        waifuButton.addTarget(self, action: #selector(setNewWaifu), for: .touchUpInside)

        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true

        waifuButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50).isActive = true
        waifuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        waifuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50).isActive = true
    }

}

