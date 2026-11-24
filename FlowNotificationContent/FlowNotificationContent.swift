import SwiftUI
import UIKit
import UserNotifications
import UserNotificationsUI

@objc(NotificationViewController)
final class NotificationViewController: UIViewController, UNNotificationContentExtension {
    private var hostingController: UIHostingController<NotificationTrafficView>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }

    func didReceive(_ notification: UNNotification) {
        let payload = decodePayload(from: notification.request.content)
        let rootView = NotificationTrafficView(payload: payload)

        if let hostingController {
            hostingController.rootView = rootView
        } else {
            let controller = UIHostingController(rootView: rootView)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            controller.view.backgroundColor = .clear
            addChild(controller)
            view.addSubview(controller.view)
            NSLayoutConstraint.activate([
                controller.view.topAnchor.constraint(equalTo: view.topAnchor),
                controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
            controller.didMove(toParent: self)
            self.hostingController = controller
        }

        let targetWidth = view.bounds.width > 0 ? view.bounds.width : 360
        let rowCount = max(1, payload.rowCount ?? ((payload.stations.compactMap(\.row).max() ?? 0) + 1))
        let targetHeight: CGFloat
        if payload.stations.isEmpty {
            targetHeight = 235
        } else if rowCount <= 1 {
            targetHeight = 375
        } else if rowCount == 2 {
            targetHeight = 465
        } else {
            targetHeight = 515
        }
        hostingController?.view.setNeedsLayout()
        hostingController?.view.layoutIfNeeded()
        preferredContentSize = CGSize(width: targetWidth, height: targetHeight)
    }

    private func decodePayload(from content: UNNotificationContent) -> TrafficNotificationPayload {
        if let jsonString = content.userInfo[TrafficNotificationPayload.userInfoKey] as? String,
           let data = jsonString.data(using: .utf8),
           let decoded = try? JSONDecoder().decode(TrafficNotificationPayload.self, from: data)
        {
            return decoded
        }

        if let lineId = content.userInfo["lineId"] as? String,
           let typeRaw = content.userInfo["transportTypeRaw"] as? String,
           let defaults = UserDefaults(suiteName: TrafficNotificationPayload.appGroupSuite),
           let data = defaults.data(forKey: TrafficNotificationPayload.appGroupKey(typeRaw: typeRaw, lineId: lineId)),
           let decoded = try? JSONDecoder().decode(TrafficNotificationPayload.self, from: data)
        {
            return decoded
        }

        return TrafficNotificationPayload(
            lineId: "?",
            transportTypeRaw: "Ligne",
            lineColorHex: "007AFF",
            textColorHex: "FFFFFF",
            logoPNGData: nil,
            statusRaw: "disrupted",
            statusDescription: "Info Trafic",
            severityColorHex: "FF9500",
            severityIcon: "exclamationmark.triangle.fill",
            title: content.title.isEmpty ? "Info Trafic" : content.title,
            message: content.body,
            impactedSection: content.subtitle.isEmpty ? nil : content.subtitle,
            resumptionDate: nil,
            resumptionText: nil,
            stations: [],
            totalStationsCount: 0
        )
    }
}
