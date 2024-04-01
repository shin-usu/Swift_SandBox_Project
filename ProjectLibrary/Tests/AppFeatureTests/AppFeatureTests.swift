import XCTest
import SnapshotTesting
@testable import AppFeature

var smallLayout: SwiftUISnapshotLayout {
    var layout: ViewImageConfig = .iPhoneSe(.portrait)
    layout.safeArea = .zero
    return .device(config: layout)
}
var bigLayout: SwiftUISnapshotLayout {
    var layout: ViewImageConfig = .iPhone13ProMax(.portrait)
    layout.safeArea = .zero
    return .device(config: layout)
}

final class MyLibraryTests: XCTestCase {
    func testRootViewSnapshot() throws {
        let view = RootView()
        assertSnapshot(
            of: view,
            as: .image(layout: bigLayout),
            named: "iPhone13ProMax"
        )
        assertSnapshot(
            of: view,
            as: .image(layout: smallLayout),
            named: "iPhoneSe"
        )
    }
}
