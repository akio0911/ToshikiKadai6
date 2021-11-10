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

    private var answer = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        resetGame()
    }

    @IBAction private func checkButtonPressed(_ sender: UIButton) {
        let selectedNum = Int(selectNumSlider.value)
        let resultText: String

        if answer == selectedNum {
            resultText = "あたり！"
        } else {
            resultText = "はずれ！"
        }
        let alert = UIAlertController(title: "結果",
                                      message: "\(resultText)\nあなたの値：\(selectedNum)",
                                      preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "再挑戦", style: .cancel) { [weak self] _ in
            self?.resetGame()
        }

        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    private func resetGame() {
        answer = Int.random(in: 1...100)
        targetNumLabel.text = String(answer)
        selectNumSlider.value = 50
    }
}
