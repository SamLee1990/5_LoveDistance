//
//  ViewController.swift
//  5_LoveDistance
//
//  Created by 李世文 on 2021/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    //劍與劍鞘View
    @IBOutlet weak var scabbardImageView: UIImageView!
    @IBOutlet weak var swordImageView: UIImageView!
    //點點Views
    @IBOutlet var littleBitImageViewCollection: [UIImageView]!
    //點點SubView
    @IBOutlet weak var bitSubUIView: UIView!
    //label
    @IBOutlet weak var distanceLabel: UILabel!
    //劍與劍鞘autolayout
    @IBOutlet weak var scabbardLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var swordTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var scabbardWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var swordWidthConstraint: NSLayoutConstraint!
    
    var scabbardWidth:CGFloat!
    var swordWidth:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //劍鞘 初始透明度
        scabbardImageView.alpha = 8 / 43
        //劍與劍鞘 初始寬度
        scabbardWidth = scabbardImageView.frame.width
        swordWidth = swordImageView.frame.width
        //little dit 初始位置
        littleBitUpdateLocation(distance: 0)
    }

    @IBAction func distanceSetting(_ sender: UISlider) {
        //slider的值
        var distance = CGFloat(sender.value)
        //四捨五入
        distance.round()
        //設定Label
        distanceLabel.text = "\(Int(distance))"
        //劍與劍鞘 移動
        move(distance: distance)
        //劍鞘 改變透明度
        scabbardImageView.alpha = (distance + 40) / 215
        //劍與劍鞘 改變大小
        scabbardWidthConstraint.constant = scabbardWidth - distance
        swordWidthConstraint.constant = swordWidth - distance
        //點點 繞圓移動
        littleBitUpdateLocation(distance: distance)
    }
    
    func move(distance: CGFloat) {
        //設定距離
        scabbardLeadingConstraint.constant = distance + 10
        //sword的移動速度是scabbard的兩倍
        swordTrailingConstraint.constant = distance * 2 + 10

    }
    
    func littleBitUpdateLocation(distance: CGFloat){
        var degrees = distance * (72 / 35)// (360 / 175)
        //計算繞圈半徑
        let radius = -(bitSubUIView.frame.width / 2 - 30)
        //總共六個小點
        for item in 0...5 {
            littleBitImageViewCollection[item].transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: radius)
            degrees += 60
        }
        
    }
    
}

