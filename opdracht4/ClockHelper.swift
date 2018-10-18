//
//  ClockHelper.swift
//  opdracht4
//
//  Created by student on 18/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//


import Foundation

protocol ClockHelperDelegate{
    func updateClock(_ result: [Words])
}

class  ClockHelper {
    var delegate: ClockHelperDelegate
    
    init(delegate: ClockHelperDelegate){
        self.delegate = delegate
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            self.updateClock(timer)
        }
    }
    func updateClock(_ timer: Timer) {
        let date=Date ()
        let calendar=Calendar.current
        let hour=calendar.component(.hour,from: date)
        let minutes=calendar.component(.minute,from: date)
        
        
        
        let result = [Words(rawValue: 11),Words.VOOR,Words.KWART]
        
        delegate.updateClock(result as! [Words])
    }
}
