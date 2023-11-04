//
//  ViewController.swift
//  diceByCode
//
//  Created by Дмитрий on 22.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImageView: UIImageView = { // название элемента: тип элемента(UIImageView)
        let imageView = UIImageView() // imageView внутреннее название (можно было назвать backgroundImageView так же как и внешнее имя)
        // внутреннее название применяется только внутри
        imageView.contentMode = .scaleAspectFill //  изображение будет во весь экран
        imageView.image = UIImage(named: "GreenBackground") // имя файла ассета которое мы хотим присвоить
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()  // таким образом создаем каждый элемент
    
    
    let logoImageView: UIImageView = { // наш логотип
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // применяем scaleAspectFit чтобы лого корректно отображалось
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let diceOneImageView: UIImageView = { // кость 1
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DiceOne")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let diceTwoImageView: UIImageView = { // кость 2
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DiceTwo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    lazy var rollButton: UIButton = { // настройки кнопки
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12 // скругление углов
        button.titleLabel?.font = .systemFont(ofSize: 32) // размер шрифта и стиль (здесь системный)
        button.tintColor = .white // цвет шрифта
        
        // edit - format - show color вызов пипетки
        
        button.backgroundColor = UIColor(red: 155/255, green: 28/255, blue: 31/255, alpha: 1) // цвет бэкграунда значения берем из комментария выше
        
        button.setTitle("Roll", for: .normal) // текст кнопки
        button.translatesAutoresizingMaskIntoConstraints = false // система автоматически создает constraints на основе кадра представления и его маски.
        button.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside) // вызов логики кнопки
        return button
    } ()
    @objc func rollButtonTapped () {
        let arrayDice = [UIImage(named: "DiceOne"),
                         UIImage(named: "DiceTwo"),
                         UIImage(named: "DiceThree"),
                         UIImage(named: "DiceFour"),
                         UIImage(named: "DiceFive"),
                         UIImage(named: "DiceSix")]
        diceOneImageView.image = arrayDice.randomElement()!
        diceTwoImageView.image = arrayDice.randomElement()!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        // добавили наше вью в сабвью backgroundImageView  в иерархию
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true // у нашего сабвью backgroundImageView длаем привязку к верхней части экрана так же как и у оснвоной вью
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true // -/- низ
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true // -/- левая часть экрана
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true // -/- правая часть экрана
        // иницализация и привязвка бэкграудна
        
        view.addSubview(logoImageView)
        
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        // привязка к низу не нужна тк нам не надо его растягивать на весь экран
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        // инициализация и привязка лого
        
        view.addSubview(diceOneImageView)
        // левый кубик
        diceOneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true // прикрепили к центру по оси у
        diceOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true // отступ от левой части 40
        diceOneImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true // настроили ширину левого кубика
        diceOneImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true // настроили высоту левого кубика
        // низ теперь не нужен
        
        view.addSubview(diceTwoImageView)
        // правый кубик
        diceTwoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceTwoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true // отступ ТОЛЬКО от правой части экрана
        diceTwoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true //настроили ширину правого кубика
        diceTwoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true //настроили ширину правого кубика

        view.addSubview(rollButton)

        rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // по центру оси х
        rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120).isActive = true // используем safeAreaLayoutGuide всегда когда отталкиваемся от верха и низа экрана
        rollButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rollButton.heightAnchor.constraint(equalToConstant: 75).isActive = true

    }


}

