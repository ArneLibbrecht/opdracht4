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
        var hour=calendar.component(.hour,from: date)
        let minutes=calendar.component(.minute,from: date)
        
        var result:[Words]=[]
        
        switch minutes{
        case ..<5: break
        case ..<10:
            result.append(Words.VIJFM)
            result.append(Words.OVER)
        case ..<15:
            result.append(Words.TIENM)
            result.append(Words.OVER)
        case ..<20:
            result.append(Words.KWART)
            result.append(Words.OVER)
        case ..<25:
            result.append(Words.TIENM)
            result.append(Words.VOOR)
            result.append(Words.HALF)
        case ..<30:
            result.append(Words.VIJFM)
            result.append(Words.VOOR)
            result.append(Words.HALF)
        case ..<35:
            result.append(Words.HALF)
        case ..<40:
            result.append(Words.VIJFM)
            result.append(Words.OVER)
            result.append(Words.HALF)
        case ..<45:
            result.append(Words.TIENM)
            result.append(Words.OVER)
            result.append(Words.HALF)
        case ..<50:
            result.append(Words.KWART)
            result.append(Words.VOOR)
        case ..<55:
            result.append(Words.TIENM)
            result.append(Words.VOOR)
        default:
            result.append(Words.VIJFM)
            result.append(Words.VOOR)
        }
        
        if(minutes>=20){
            hour=hour+1
        }
        if(hour>12){
            hour=hour-12
        }
        result.append(Words(rawValue: hour)!)
        
        
        //let result = [Words(rawValue: 11),Words.VOOR,Words.KWART]
        
        delegate.updateClock(result)
    }
}
