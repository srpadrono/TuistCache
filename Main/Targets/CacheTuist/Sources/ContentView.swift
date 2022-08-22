import SwiftUI
import ModuleB
import ModuleA
import ModuleC
import ModuleD

public struct ContentView: View {
    let moduleA = ModuleA()
    let moduleB = ModuleB()
    let moduleC = ModuleC()
    let moduleD = ModuleD()
    
    
    public init() {}

    public var body: some View {
        Text("\(moduleA.text) - \(moduleA.version)").padding()
        Text("\(moduleB.text) - \(moduleB.version)").padding()
        Text("\(moduleC.text) - \(moduleC.version)").padding()
        Text("\(moduleD.text) - \(moduleD.version)").padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
