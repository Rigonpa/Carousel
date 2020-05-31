//
//  SceneDelegate.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let carouselViewModel = CarouselViewModel(products: testData)
        let carouselViewController = CarouselViewController(viewModel: carouselViewModel)
        carouselViewController.title = "Products"
        
        window?.rootViewController = UINavigationController(rootViewController: carouselViewController)
        window?.makeKeyAndVisible()
    }

}

let testData: [Product] = [
    Product(name: "El señor de los anillos", category: .book),
    Product(name: "Star Wars", category: .book),
    Product(name: "1984", category: .book),
    Product(name: "Neuromante", category: .book),
    Product(name: "Un mundo feliz", category: .book),
    Product(name: "Yo, Robot", category: .book),
    Product(name: "El señor de los anillos", category: .book),
    Product(name: "Star Wars", category: .book),
    Product(name: "1984", category: .book),
    Product(name: "Neuromante", category: .book),
    Product(name: "Un mundo feliz", category: .book),
    Product(name: "Yo, Robot", category: .book),

    Product(name: "Zelda Breath of the wild", category: .videogames),
    Product(name: "The Witcher 3", category: .videogames),
    Product(name: "Skyrim", category: .videogames),
    Product(name: "Dragon quest builders", category: .videogames),

    Product(name: "iPad Pro", category: .hardware),
    Product(name: "Macbook Pro", category: .hardware),
    Product(name: "Magic keyboard", category: .hardware),
    Product(name: "Magic trackpad 2", category: .hardware)
]

