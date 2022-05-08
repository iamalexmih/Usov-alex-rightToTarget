//
//  HexToUIColor.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 08.05.2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) { //делаем init Опциональны, чтоб в случае ошибки вернуть nil
        //подготовка строки
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)//очишаем строку от пробелов и переносов
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")//замена символа # на пустой символ
        
        //HEX код может быть 6 и 8 цифр. 8 цифр используются для передачи альфа, прозрачности.
        let length = hexSanitized.count
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        //Надо преобразовать строку в 64битное число, Для этого используем объект Scanner, и его метод. Сканер сканирует строку и помещает результат в переменную.
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { // & значок Амперсанд. Метод требует чтоб мы указали ссылку на переменную. Если без &, то мы передаем копию.
            return nil
        }
        
        //переведем 16-ричное представление в представление RGB. Используем побитовую маску.
        // #FF0000 красный цвет в 16-ричном виде
        // 1111 1111 0000 0000 красный цвет в бинарном виде
        // 0b11111111 число 255 бинарном виде
        
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0 //в RGB число представлено от 0 до 1, поэтому делим на 255.
            //1111 1111 0000 0000 0000 0000
            //после применения маски и сдвига вправо на 16. Надо наше значение FF сдвинуть в самый конец.
            //0000 0000 0000 0000 1111 1111
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
