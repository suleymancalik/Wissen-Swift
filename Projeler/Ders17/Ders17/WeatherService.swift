//
//  WeatherService.swift
//  Ders17
//
//  Created by Suleyman Calik on 04/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

enum WeatherUnit:Int {
    case Celsius
    case Fahrenheit
}



class WeatherService: NSObject {

    func getWeather(city:String,language:String,unit:WeatherUnit, result:(weather:Weather) -> () ) {
        
        // TODO
    }
}





