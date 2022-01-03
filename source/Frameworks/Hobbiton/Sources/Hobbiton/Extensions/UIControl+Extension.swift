//
//  UIControl+Extension.swift
//  
//
//  Created by Антон Тимонин on 03.01.2022.
//

import UIKit
import Combine

public extension UIControl {
    
    class EventSubcription<S: Subscriber>: Subscription where S.Input == Void {
        public var subscriber: S?
        
        public func request(_ demand: Subscribers.Demand) {
            
        }
        
        public func cancel() {
            subscriber = nil
        }
        
        public init(subscriber: S) {
            self.subscriber = subscriber
        }
        
        @objc func trigger() {
            _ = subscriber?.receive()
        }
        
    }
    
    struct EventPublisher: Publisher {
        
        public typealias Output = Void
        
        public typealias Failure = Never
        
        public var control: UIControl
        
        public var event: Event
        
        public func receive<S: Subscriber>(subscriber: S) where S.Input == Void, S.Failure == Never {
            let subcription = EventSubcription(subscriber: subscriber)
            subscriber.receive(subscription: subcription)
            control.addTarget(subcription, action: #selector(subcription.trigger), for: event)
        }
        
    }
    
    func publisher(for event: Event) -> EventPublisher {
        EventPublisher(control: self, event: event)
    }
    
}
