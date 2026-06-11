import SwiftUI

struct TransportTypeIcon: View {
    let type: TransportType

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)

            Group {
                switch type {
                case .metro:
                    Image("Metro")
                        .resizable()
                        .scaledToFit()
                case .rer:
                    Image("RER")
                        .resizable()
                        .scaledToFit()
                case .train, .transilien:
                    Image("Transilien")
                        .resizable()
                        .scaledToFit()
                case .tram:
                    Image("Tram")
                        .resizable()
                        .scaledToFit()
                case .bus:
                    Image("Bus")
                        .resizable()
                        .scaledToFit()
                case .cable:
                    Image("Cable")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(width: size, height: size)
        }
    }
}

#Preview {
    HStack(spacing: 10) {
        ForEach(TransportType.allCases) { type in
            TransportTypeIcon(type: type)
                .frame(width: 40, height: 40)
        }
    }
    .padding()
}

