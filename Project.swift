import Foundation
import ProjectDescription

let project = Project(
    name: "FeatherNotes",
    targets: [
        .target(
            name: "FeatherNotes",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .app,
            bundleId: "dev.pietech.feathernotes",
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
                .target(name: "FeatherNotesCore"),
                .target(name: "FeatherNotesCoreUI"),
                .target(name: "FeatherNotesResources"),
                .external(name: "Realm"),
                .external(name: "RealmSwift")
            ]
        ),
        .target(
            name: "FeatherNotesCore",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .framework,
            bundleId: "dev.pietech.feathernotes.core",
            sources: ["FeatherNotesCore/**"],
            dependencies: [
                .external(name: "Realm"),
                .external(name: "RealmSwift")
            ]
        ),
        .target(
            name: "FeatherNotesCoreUI",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .framework,
            bundleId: "dev.pietech.feathernotes.coreui",
            sources: ["FeatherNotesCoreUI/**"],
            dependencies: [
                .target(name: "FeatherNotesCore"),
                .target(name: "FeatherNotesResources")
            ]
        ),
        .target(
            name: "FeatherNotesResources",
            destinations: Set<Destination>([.iPhone, .iPad]),
            product: .bundle,
            bundleId: "dev.pietech.feathernotes.resources",
            resources: ["FeatherNotesResources/**"],
            dependencies: []
        )
    ]
)
