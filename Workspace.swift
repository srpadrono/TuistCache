//
//  Workspace.swift
//  MainAppManifests
//
//  Created by Padron, Sergio on 16/05/2022.
//

import ProjectDescription

let workspace = Workspace(
    name: "TuistCache",
    projects: ["Modules/**"],
    generationOptions: .options(enableAutomaticXcodeSchemes: false,
                                autogeneratedWorkspaceSchemes: .enabled(codeCoverageMode: .all,
                                                                        testingOptions: []),
                                lastXcodeUpgradeCheck: nil)
)

