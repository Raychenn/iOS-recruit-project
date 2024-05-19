import Foundation

final class ObservableObject<T> {
    
    var value: T {
        didSet {
            // fire the listenser once value has changed
            listenser?(value)
            listensers?.forEach({ block in
                block(value)
            })
        }
    }
    
    // will bind to a single instance
    var listenser: ((T) -> Void)?
    // Allows many ObservableObject instances bind(react) to the same value
    var listensers: [(T) -> Void]?
    
    init(value: T) {
        self.value = value
    }
    
    // send back the value of this Channel
    func bind(_ listener: @escaping (T) -> Void) {
        // set our listener to whatever closure that is passing in
        self.listenser = listener
    }
    
    func bind(_ listeners: [(T) -> Void]? ) {
        // set our listener to whatever closure that is passing in
        self.listensers = listeners
    }
}
