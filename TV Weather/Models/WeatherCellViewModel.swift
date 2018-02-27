//
//  WeatherCellViewModel.swift
//  TV Weather
//
//  Created by Daniel Catlett on 2/26/18.
//  Copyright © 2018 Daniel Catlett. All rights reserved.
//

import UIKit

struct weatherCellViewModel
{
    let url: URL
    let day: String
    let description: String
    
    func loadImage(completion: @escaping (UIImage?) -> Void)
    {
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        let image = UIImage(data: imageData)
        DispatchQueue.main.async
        {
            completion(image)
        }
        
    }
}
