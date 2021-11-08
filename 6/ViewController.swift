//
//  ViewController.swift
//  6
//
//  Created by Toshiyana on 2021/11/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var targetNumLabel: UILabel!
    @IBOutlet private weak var selectNumSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        targetNumLabel.text = String(Int.random(in: 1...100))
        selectNumSlider.value = 50
    }

    @IBAction private func checkButtonPressed(_ sender: UIButton) {
        let targetedNum = Int(targetNumLabel.text!)
        let selectedNum = Int(selectNumSlider.value)
        let resultText: String

        if targetedNum != selectedNum {
            resultText = "はずれ！"
        } else {
            resultText = "あたり！"
        }
        let alert = UIAlertController(title: "結果",
                                      message: "\(resultText)\nあなたの値：\(selectedNum)",
                                      preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "再挑戦", style: .cancel) { _ in
            self.targetNumLabel.text = String(Int.random(in: 1...100))
            self.selectNumSlider.value = 50
        }

        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
