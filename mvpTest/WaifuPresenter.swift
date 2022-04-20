//
//  WaifuPresenter.swift
//  mvpTest
//
//  Created by Emil Shpeklord on 19.04.2022.
//

import Foundation
import UIKit

final class WaifuPresenter: WaifuPresentationProtocol {
    private var waifuService: WaifuApiService
    weak var viewDelegate: WaifuProtocol?

    init(service: WaifuApiService) {
        self.waifuService = service
    }

    func setViewDelegate(waifuDelegate: WaifuProtocol?) {
        self.viewDelegate = waifuDelegate
    }

    func getWaifu() {
        waifuService.getRandomWaifu(completion: { waifuUrl in
            guard let url = URL(string: waifuUrl.url) else { return }
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    self.viewDelegate?.displayWaifu(waifu: image)
                }
            }
        })
    }

}
