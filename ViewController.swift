//
//  ViewController.swift
//  carouselgame
//
//  Created by chigo anyaso on 2017-03-20.
//  Copyright © 2017 chigo anyaso. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource, UIPickerViewDataSource, UIPickerViewDelegate  {
    @IBOutlet weak var swipetext: UILabel!
    @IBOutlet weak var indexforcarousel: UILabel!
    var moneysToBet = [String]()
    let money = 200
    var numberofstackedcoins = 0
    @IBOutlet weak var moneyinacctlabel: UILabel!
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var selectedmoneyforbet: UILabel!
    var array = [UIImage]()
    @IBOutlet weak var outlet_for_noOfstackedCoins: UILabel!
    @IBOutlet weak var icarouselview: iCarousel!
    override func viewDidLoad() {
        super.viewDidLoad()
        icarouselview.type = .coverFlow
        moneysToBet = ["30$", "50$", "100$", "all"]
        moneyinacctlabel.text = "\(money)$"
        
        outlet_for_noOfstackedCoins.text = "\(numberofstackedcoins) COINS In Stack"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            
            self.swipetext.alpha = 0.3
            self.swipetext.frame = CGRect(x: 30, y: 17, width: 326 , height: 39 )
            
        }, completion: nil)

        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moneysToBet.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print("row is \(row)")
        return moneysToBet[row]

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        selectedmoneyforbet.text = moneysToBet[row]
        print("row is \(row)")
    }
    
    
    
    
    
//  
    
    
    
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
        print("Started")
        
        UIView.animate(withDuration: 6, animations: {
            self.swipetext.alpha -= 1
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        numberofstackedcoins = Helper.Instance.randomRange(min: 30, max: 50)
        print(numberofstackedcoins)
        
        for _ in 0..<numberofstackedcoins{
            array.append(UIImage(named: "coin")!)
        }
        array.append(UIImage(named: "coin2")!)
        

    }
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return array.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tempview.isOpaque = false
//        print("here \(index)")
        
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageview.image = array[index]
        tempview.addSubview(imageview)
        return tempview
    }
    
//    var carouselTimer : Timer!
    var counter = 0
    //
    
    //in viewDidLoad
//    carouselTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(selectIteminCarousel), userInfo: nil, repeats: true)
    //
    
   
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        
        if index < 3{
//            carousel.scrollToItem(at: array.count, duration: 2)
//            carousel.scrollToItem(at: 0, animated: true)
            for i in 0...index{
            array.remove(at: i)
                carousel.reloadData()
                
//                carousel.scrollToItem(at: 0, duration: 2)
            }
        }
    }
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        
        indexforcarousel.text = "\(carousel.currentItemIndex)"
    }
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        return true
    }
//    func carousel(_ carousel: iCarousel, placeholderViewAt index: Int, reusing view: UIView?) -> UIView {
//        
//    }
    
    
    @IBAction func Betbtn(_ sender: Any) {
           }
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing{
            return value * 1.2
        }
        return value
    }
    
    
    
    
}

