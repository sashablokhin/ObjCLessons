//
//  ViewController.h
//  Properties
//
//  Created by Alexander Blokhin on 12.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ABObject; // вместо import

@interface MainClass : NSObject

// по умолчанию atomic - потоконезависим, она медленнее (доступ к свойству) но хорошо подходит когда мы работаем с потоками. nonatomic - потоконезащищены, когда работаем в одном потоке. По умолчанию так же идет readwrite - доступ к геттерам и сеттерам открыт, readonly - доступ к сеттерам закрыт
// strong - сильная ссылка - объект существует пока на него есть хотя бы одна сильная ссылка
// weak - слабая ссылка - не увеличивает количество ссылок на объект, установится в nil если объект уничтожен
// assign - то же что и weak но будет указывать на мусор при уничтожении объекта, для примитивных типов вроде int, float, bool
// copy - нужен протокол NSCopying, объект будет скопирован при указании на него другой ссылки

@property (strong, nonatomic) ABObject *strongObject;
@property (copy, nonatomic) ABObject *cpyObject;

@property (strong, nonatomic, getter=getObject, setter=setCustomObject:) ABObject *getSetObject;

@end

