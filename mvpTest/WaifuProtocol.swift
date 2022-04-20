//
//  WaifuProtocol.swift
//  mvpTest
//
//  Created by Emil Shpeklord on 19.04.2022.
//

import Foundation
import UIKit

protocol WaifuProtocol: AnyObject {
    func displayWaifu(waifu: UIImage)
}

protocol WaifuPresentationProtocol: AnyObject {
    func setViewDelegate(waifuDelegate: WaifuProtocol?)
    func getWaifu()
}

protocol WaifuServiceProtocol: AnyObject {
    func getRandomWaifu(completion: @escaping (Waifu) -> Void)
}
