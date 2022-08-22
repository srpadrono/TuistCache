import SwiftUI
import ModuleB
import ModuleA

public struct ContentView: View {
    let moduleA = ModuleA()
    let moduleB = ModuleB()
    
    
    public init() {}

    public var body: some View {
        Text("\(moduleA.text) - \(moduleA.version)").padding()
        Text("\(moduleB.text) - \(moduleB.version)").padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
