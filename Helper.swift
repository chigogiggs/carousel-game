//
//  Helper.swift
//  carouselgame
//
//  Created by chigo anyaso on 2017-03-21.
//  Copyright © 2017 chigo anyaso. All rights reserved.
//

import Foundation
import AVFoundation


class Helper{
    
    private static let _instance = Helper()
    
    private init() {}
    
    static var Instance: Helper {
        return _instance
    }
    
    
    
    func randomRange(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    
    func playsound(song: String, type: String) -> AVAudioPlayer{
        var player: AVAudioPlayer = AVAudioPlayer()
        let audioPath = Bundle.main.path(forResource: song, ofType: type)
        do {
            player = try AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            print("Played!!!")
            return player
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }
        return player
    }
}
