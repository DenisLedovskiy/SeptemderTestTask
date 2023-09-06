import UIKit
import WebKit

protocol GoogleViewDelegate: AnyObject {}

class GoogleView: UIView, WKNavigationDelegate {

    // MARK: - properties

    weak var delegate: GoogleViewDelegate?

    // MARK: - views

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        let url = URL(string: "https://www.google.com/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }()

    // MARK: - overrides

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = Design.Color.white
        // MARK: - Add Subviews
        addSubview(webView)

        // MARK: - Add Constraints
        setupConstraintsForWebView()
    }

    // MARK: - methods

}

// MARK: - constraits extensions

extension GoogleView {
    private func setupConstraintsForWebView() {
        webView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
