//
//  ViewController.swift
//  opdracht4
//
//  Created by student on 11/10/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ClockHelperDelegate {

    
    @IBOutlet var hetis_WORD: [UILabel]!
    
    @IBOutlet var vijf_MIN: [UILabel]!
    
    
    @IBOutlet var tien_MIN: [UILabel]!
    
    @IBOutlet var kwart: [UILabel]!

    @IBOutlet var over: [UILabel]!
    
    @IBOutlet var voor: [UILabel]!
    
    @IBOutlet var half: [UILabel]!
    
    
    
    //uren
    @IBOutlet var een_UUR: [UILabel]!
    @IBOutlet var twee_UUR: [UILabel]!
    @IBOutlet var drie_UUR: [UILabel]!
    @IBOutlet var vier_UUR: [UILabel]!
    @IBOutlet var vijf_UUR: [UILabel]!
    @IBOutlet var zes_UUR: [UILabel]!
    @IBOutlet var zeven_UUR: [UILabel]!
    @IBOutlet var acht_UUR: [UILabel]!
    @IBOutlet var negen_UUR: [UILabel]!
    @IBOutlet var tien_UUR: [UILabel]!
    @IBOutlet var elf_UUR: [UILabel]!
    @IBOutlet var twaalf_UUR: [UILabel]!
    
    var words:[Words:[UILabel]] = [:]
   
    func initWords(){
        words=[
            Words.VIJFM:vijf_MIN!,
            Words.TIENM:tien_MIN!,
            Words.KWART:kwart!,
            Words.HALF:half!,
            Words.VOOR:voor!,
            Words.OVER:over!,
            Words(rawValue: 1)!:een_UUR!,
            Words(rawValue: 2)!:twee_UUR!,
            Words(rawValue: 3)!:drie_UUR!,
            Words(rawValue: 4)!:vier_UUR!,
            Words(rawValue: 5)!:vijf_UUR!,
            Words(rawValue: 6)!:zes_UUR!,
            Words(rawValue: 7)!:zeven_UUR!,
            Words(rawValue: 8)!:acht_UUR!,
            Words(rawValue: 9)!:negen_UUR!,
            Words(rawValue: 10)!:tien_UUR!,
            Words(rawValue: 11)!:elf_UUR!,
            Words(rawValue: 12)!:twaalf_UUR!
        ]
    }
    
    func updateClock(_ result: [Words]){
        var letters:[UILabel]=[]
        for letter in words.values{
            for l in letter{
                l.textColor=UIColor.white
            }
        }
        letters.removeAll()
        letters.append(contentsOf: hetis_WORD!)
        for w in result{
            letters.append(contentsOf: words[w]! as [UILabel])
        }
        for l in letters{
            l.textColor=UIColor.red
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClockHelper(delegate:self)
        initWords()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

