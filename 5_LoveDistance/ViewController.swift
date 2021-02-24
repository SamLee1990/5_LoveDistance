//
//  ViewController.swift
//  5_LoveDistance
//
//  Created by 李世文 on 2021/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scabbardImageView: UIImageView!
    @IBOutlet weak var swordImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var scabbardLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var swordTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scabbardWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var swordWidthConstraint: NSLayoutConstraint!
    
    var scabbardWidth:CGFloat!
    var swordWidth:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始透明度
        scabbardImageView.alpha = 8 / 43
        //初始寬度
        scabbardWidth = scabbardImageView.frame.width
        swordWidth = swordImageView.frame.width
    }

    @IBAction func distanceSetting(_ sender: UISlider) {
        //slider的值
        var distance = CGFloat(sender.value)
        //四捨五入
        distance.round()
        //設定Label
        distanceLabel.text = "\(Int(distance))"
        //移動
        move(distance: distance)
        //改變透明度
        scabbardImageView.alpha = (distance + 40) / 215
        //改變大小
        scabbardWidthConstraint.constant = scabbardWidth - distance
        swordWidthConstraint.constant = swordWidth - distance
    }
    
    func move(distance: CGFloat) {
        //設定距離
        scabbardLeadingConstraint.constant = distance + 10
        //sword的移動速度是scabbard的兩倍
        swordTrailingConstraint.constant = distance * 2 + 10

    }
    
}

