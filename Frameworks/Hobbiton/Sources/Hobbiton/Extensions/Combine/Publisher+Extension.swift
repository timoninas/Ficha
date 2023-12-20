//
//  Publisher+Extension.swift
//  
//
//  Created by Anton Timonin on 07.10.2022.
//

import Combine

extension Publisher where Failure == Never {
    
    /// Создает `assign` со слабой ссылкой.
    func weakAssign<T: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<T, Output>,
        on object: T
    ) -> AnyCancellable {
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }

    /// Создает `sink` со слабой ссылкой.
    func weakSink<T: AnyObject>(
        _ weaklyCaptured: T,
        receiveValue: @escaping (T, Self.Output) -> Void
    ) -> AnyCancellable {
        sink { [weak weaklyCaptured] output in
            guard let strongRef = weaklyCaptured else { return }
            receiveValue(strongRef, output)
        }
    }
    
}
