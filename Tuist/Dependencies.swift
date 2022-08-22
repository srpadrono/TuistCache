//
//  Dependencies.swift
//  Config
//
//  Created by Padron, Sergio on 28/03/2022.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .local(path: "Modules/ModuleA/ModuleA"),
        .local(path: "Modules/ModuleB/ModuleB"),
        .local(path: "Modules/ModuleC/ModuleC"),
        .local(path: "Modules/ModuleD/ModuleD")
    ],
    platforms: [.iOS]
)
