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

    func getWeather(city:String,language:String,unit:WeatherUnit, result:(weather:Weather!) -> () ) {
        
        
        //Istanbul&units=metric&lang=tr
        
        var unitStr = unit == .Celsius ? "metric" : ""
        
        var urlString =
        "http://api.openweathermap.org/data/2.5/weather?q="
            + city
            + "&units=" + unitStr
            + "&lang=" + language
        
        
        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        var manager = AFHTTPRequestOperationManager()
        manager.GET(urlString, parameters:nil, success: { (operation, object) -> Void in
            // Çağrı başarılı olursa burası çalışacak
            
            println(object)
            
            if let code = object["cod"] as? Int {
                if code == 404 {
                    result(weather:nil)
                }
                else {
                    var weather = Weather()
                    
                    if let main:AnyObject = object["main"] {
                        if let temp:Float = main["temp"] as? Float {
                            weather.temprature = temp
                        }
                    }
                    
                    if let weatherArray = object["weather"] as? Array<AnyObject> {
                        if let weatherObject:AnyObject = weatherArray.first {
                            
                            if let description = weatherObject["description"] as? String {
                                weather.desc = description
                            }
                            if let icon = weatherObject["icon"] as? String {
                                weather.icon = icon
                            }
                        }
                    }
                    
                    weather.unit = unit
                    
                    result(weather:weather)
                }
            }
            else {
                println("")
            }
            

            
        }) { (operation, error) -> Void in
            //Çağrı başarısız olursa burası çalışacak
            result(weather:nil)
        }
    }
}





