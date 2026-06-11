import SwiftUI
import MapKit

#if !canImport(UIKit)
import AppKit

// MARK: - CoreLocation & MapKit compatibility

public enum MKUserTrackingMode: Int {
    case none = 0
    case follow = 1
    case followWithHeading = 2
}

// MARK: - UIKit/AppKit Type Mappings

typealias UIViewRepresentable = NSViewRepresentable
typealias UIView = NSView
typealias UIImage = NSImage
typealias UIColor = NSColor
typealias UIEdgeInsets = NSEdgeInsets

class UIHostingController<Content: View>: NSHostingController<Content> {}

extension NSImage {
    convenience init?(systemName: String) {
        self.init(systemSymbolName: systemName, accessibilityDescription: nil)
    }
}

// MARK: - System Color Compatibility

extension NSColor {
    static var systemGray6: NSColor {
        if #available(macOS 10.15, *) {
            return NSColor.windowBackgroundColor
        } else {
            return NSColor.lightGray
        }
    }
    
    static var systemBackground: NSColor {
        return NSColor.windowBackgroundColor
    }
}

// MARK: - SwiftUI Navigation Compatibility

struct NavigationBarItem {
    enum TitleDisplayMode {
        case automatic
        case inline
        case large
    }
}

extension View {
    func navigationBarTitleDisplayMode(_ mode: NavigationBarItem.TitleDisplayMode) -> some View {
        self
    }
    
    func navigationBarTitle(_ title: String, displayMode: NavigationBarItem.TitleDisplayMode) -> some View {
        self
    }
    
    func navigationBarItems<T>(trailing: T) -> some View where T: View {
        self
    }
}

// MARK: - SwiftUI Search Bar Placement Compatibility

struct NavigationBarDrawerDisplayModeMock {
    static let always = NavigationBarDrawerDisplayModeMock()
    static let automatic = NavigationBarDrawerDisplayModeMock()
}

extension SearchFieldPlacement {
    static func navigationBarDrawer(displayMode: NavigationBarDrawerDisplayModeMock) -> SearchFieldPlacement {
        return .automatic
    }
}

// MARK: - SwiftUI Toolbar Placement Compatibility

extension ToolbarItemPlacement {
    static var navigationBarTrailing: ToolbarItemPlacement {
        return .primaryAction
    }
    static var navigationBar: ToolbarItemPlacement {
        return .navigation
    }
}

extension ToolbarPlacement {
    static var navigationBar: ToolbarPlacement {
        return .automatic
    }
}
#endif
