import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Techblog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://kokiHirokawa.github.io")!
    var name = "Techblog"
    var description = "A description of Techblog"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Techblog()
    .publish(using: [
        .addMarkdownFiles(),
        .generateHTML(withTheme: .foundation),
        .sortItems(by: \.date, order: .descending),
        .generateRSSFeed(including: [.posts]),
        .generateSiteMap(),
        .deploy(using: .gitHub("KokiHirokawa/KokiHirokawa.github.io", branch: "main", useSSH: false))
    ])
