import XCTest
import SnapshotTesting
import SnapshotTestingHEIC
@testable import AppFeature

final class MyLibraryTests: XCTestCase {
    func testRootViewSnapshot() throws {
        let view = RootView()

        assertSnapshot(
            of: view,
            as: .imageHEIC(layout: .device(config: .iPhone13ProMax)),
            named: "iPhone13ProMax"
        )
        assertSnapshot(
            of: view,
            as: .imageHEIC(layout: .device(config: .iPhone13Pro)),
            named: "iPhone13Pro"
        )
        assertSnapshot(
            of: view,
            as: .imageHEIC(layout: .device(config: .iPhoneSe)),
            named: "iPhoneSe"
        )
    }
}
