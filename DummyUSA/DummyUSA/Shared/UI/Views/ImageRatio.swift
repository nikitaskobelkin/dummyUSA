import SwiftUI

struct ImageRatio: View {
    let image: ImageResource
    var height: CGFloat?
    var width: CGFloat?

    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: width, maxHeight: height)
    }
}
