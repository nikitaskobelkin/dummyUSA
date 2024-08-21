@propertyWrapper
struct Dependency<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>

    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }

    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
}
