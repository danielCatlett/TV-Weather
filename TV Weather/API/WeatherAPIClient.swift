//
//  WeatherAPIClient.swift
//  TV Weather
//
//  Created by Daniel Catlett on 2/26/18.
//  Copyright © 2018 Daniel Catlett. All rights reserved.
//

import Foundation

class weatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<ForecastText, APIError>) -> Void)
    {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either
            {
                case .value(let weather):
                    let textForecast = weather.forecast.forecastText
                    completion(.value(textForecast))
                case .error(let error):
                    completion(.error(error))
            }
        }
    }
}
