//
//  ViewController.swift
//  Kalkulator
//
//  Created by Student28 on 22/12/2021.
//

import UIKit

class ViewController: UIViewController {
    private var serviceRating: Int = 0
    private var foodRating: Int = 0
    private var orderCost: Double = 0.0
    private var defaultTipValue: Double = 0.0
    private var orderValue: Double = 0.0
    private var tipValue: Double = 0.0
    private var orderTip: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.serviceRating = 3
        self.foodRating = 3
        self.defaultTipValue = 5.0

        self.serviceRatingSliderSetup()
        self.foodRatingSliderSetup()

        self.serviceRatingLabel.text = String(self.serviceRating)
        self.foodRatingLabel.text = String(self.foodRating)
        self.defaultTipValueTextField.text = String(self.defaultTipValue)
    }

    private func serviceRatingSliderSetup() {
        self.serviceRatingSlider.minimumValue = 0
        self.serviceRatingSlider.maximumValue = 5
        self.serviceRatingSlider.isContinuous = true
        self.serviceRatingSlider.value = Float(self.serviceRating)
    }

    private func foodRatingSliderSetup() {
        self.foodRatingSlider.minimumValue = 0
        self.foodRatingSlider.maximumValue = 5
        self.foodRatingSlider.isContinuous = true
        self.foodRatingSlider.value = Float(self.foodRating)
    }

    @IBOutlet weak var serviceRatingLabel: UILabel!
    @IBOutlet weak var foodRatingLabel: UILabel!
    @IBOutlet weak var serviceRatingSlider: UISlider!
    @IBOutlet weak var foodRatingSlider: UISlider!
    @IBOutlet weak var orderValueTextField: UITextField!
    @IBOutlet weak var defaultTipValueTextField: UITextField!
    @IBOutlet weak var orderValueLabel: UILabel!
    @IBOutlet weak var orderTipLabel: UILabel!

    @IBAction func serviceRatingSliderDrag(_ sender: UISlider) {
        let step: Float = 1
        self.serviceRating = Int(round((sender.value - sender.minimumValue) / step))
        sender.value = Float(self.serviceRating)
        self.serviceRatingLabel.text = String(self.serviceRating)
    }

    @IBAction func foodRatingSliderDrag(_ sender: UISlider) {
        let step: Float = 1
        self.foodRating = Int(round((sender.value - sender.minimumValue) / step))
        sender.value = Float(self.foodRating)
        self.foodRatingLabel.text = String(self.foodRating)
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if self.orderValueTextField.text?.isEmpty != true && self.defaultTipValueTextField.text?.isEmpty != true{
            self.orderValue = Double(String(self.orderValueTextField.text ?? "0")) ?? 0
            self.tipValue = Double(String(self.defaultTipValueTextField.text ?? "0")) ?? 0
            self.orderValueLabel.text = String(self.orderValue)

            let tipValuePenalty: Double = (Double((Double(10 - (self.serviceRating + self.foodRating)) / 10)) * self.tipValue)
            self.orderTip = self.tipValue - tipValuePenalty
            self.orderTipLabel.text = String(self.orderTip)
        } else {
            let alertController = UIAlertController(title: "Błąd", message: "Niepoprawne lub puste pola: koszt zamówienia lub domyślna wartość napiwku", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


