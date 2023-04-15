
func printInDebugMode(_ items: Any...) {
    #if DEBUG
        print(items)
    #endif
}
