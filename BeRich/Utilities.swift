
func print(_ items: Any...) {
    #if DEBUG
        for item in items {
            Swift.print(item)
        }
    #endif
}

func print(_ items: Any) {
    #if DEBUG
        Swift.print(items)
    #endif
}
