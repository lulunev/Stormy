import Foundation
import UIKit


struct Current {
    var currentTime: String?
    var temperature: String?
    var humidity: Double
    var precipProbability: Double
    var summary: String
    var icon: UIImage?
    
    init(weatherDictionary: NSDictionary) {
        let currentWeather = weatherDictionary["currently"] as! NSDictionary
        
        
        
        humidity = currentWeather["humidity"] as! Double
        precipProbability = currentWeather["precipProbability"] as! Double
        summary = currentWeather["summary"] as! String
        
        let iconString = currentWeather["icon"] as! String
        icon = iconFromString(iconString)
        
        let tempFahr = currentWeather["temperature"] as! Int
        temperature = tempCelsiusFromFarengeit(tempFahr)
        
        let currentTimeIntValue = currentWeather["time"] as! Int
        currentTime = dateStringFromUnixTime(currentTimeIntValue)
        
    }
    
    func dateStringFromUnixTime(unixTime: Int) -> String {
        let timeInSeconds = NSTimeInterval(unixTime)
        let weatherdate = NSDate(timeIntervalSince1970: timeInSeconds)
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        //dateFormatter.dateStyle = .ShortStyle
        
        return dateFormatter.stringFromDate(weatherdate)
    }
    
    func tempCelsiusFromFarengeit(tempFahr: Int) -> String {
        return " \((tempFahr - 32) * 5/9)°"
    }
    
    func iconFromString(stringIcon: String) -> UIImage {
        var imageName: String
        switch stringIcon {
        case "clear-day": imageName = "clear-day"
        default: imageName = "default"
        }
        
        var iconImage = UIImage(named: imageName)
        return iconImage!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}