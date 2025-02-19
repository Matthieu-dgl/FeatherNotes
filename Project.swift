import Foundation
import ProjectDescription

let project = Project(
    name: "FeatherNotes",
    targets: [
        .target(
            name: "FeatherNotes",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .app,
            bundleId: "dev.pietech.FeatherNotes",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["FeatherNotes/Sources/**"],
            resources: ["FeatherNotes/Resources/**"],
            dependencies: [
                .external(name: "Realm"),
                .external(name: "RealmSwift")
            ]
        ),
        .target(
            name: "FeatherNotesCore",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .framework,
            bundleId: "dev.pietech.FeatherNotesCore",
            infoPlist: .default,
            sources: ["FeatherNotes/Core/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatherNotes")
            ]
        ),
        .target(
            name: "FeatherNotesCoreUI",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .framework,
            bundleId: "dev.pietech.FeatherNotesCoreUI",
            infoPlist: .default,
            sources: ["FeatherNotes/CoreUI/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatherNotes"),
                .target(name: "FeatherNotesCore"),
                .target(name: "FeatherNotesResources")
            ]
        ),
        .target(
            name: "FeatherNotesResources",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .framework,
            bundleId: "dev.pietech.FeatherNotesResources",
            infoPlist: .default,
            sources: ["FeatherNotes/Resources/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatherNotes")
            ]
        ),
        .target(
            name: "FeatherNotesTests",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .unitTests,
            bundleId: "dev.pietech.FeatherNotesTests",
            infoPlist: .default,
            sources: ["FeatherNotes/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatherNotes"),
                .external(name: "Realm"),
                .external(name: "RealmSwift")
            ]
        ),
        .target(
            name: "FeatherNotesUITests",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .uiTests,
            bundleId: "dev.pietech.FeatherNotesTests",
            infoPlist: .default,
            sources: ["FeatherNotes/UITests/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatherNotes"),
                .external(name: "Realm"),
                .external(name: "RealmSwift")
            ]
        ),
    ]
)
