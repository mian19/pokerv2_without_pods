
import UIKit
import WebKit
import StoreKit

class WebViewControler: UIViewController, WKNavigationDelegate {

    var webPage: WKWebView!
    var urlString: String? = nil
    let loader = UIActivityIndicatorView()
    let protectionSpace = URLProtectionSpace(host: "example.com", port: 0, protocol: "http", realm: nil, authenticationMethod: NSURLAuthenticationMethodHTTPBasic)
   
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var isShowNav = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            UIApplication.shared.isStatusBarHidden = true
        }
        let credential = URLCredentialStorage.shared.defaultCredential(for: protectionSpace)

              let userContentController = WKUserContentController()
              let script = "document.getElementById('username').value = '\(credential?.user ?? "")';document.getElementById('password').value = '\(credential?.password ?? "")';"
              let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
              userContentController.addUserScript(userScript)

              let configuration = WKWebViewConfiguration()
              configuration.userContentController = userContentController
        webPage = WKWebView(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: view.frame.size.height), configuration: configuration)
    
        view.addSubview(webPage)
        webPage.navigationDelegate = self
        

    }
    
    @objc func onWebB() {
        webPage.goBack()

    }
    
  
    func start() {
        
        if isShowNav {
            if !UserDefaultsManagisi.shared.checkingResultis(.firstEntrances) {
                showRat()
              
                UserDefaults.standard.set(true, forKey: CheckingTypes.firstEntrances.rawValue)
            }
            
            let navView = UIView()
            view.addSubview(navView)
            navView.translatesAutoresizingMaskIntoConstraints = false
            navView.leadingAnchor.constraint(equalTo: webPage.leadingAnchor).isActive = true
            navView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            navView.trailingAnchor.constraint(equalTo: webPage.trailingAnchor).isActive = true
            navView.heightAnchor.constraint(equalToConstant: 48).isActive = true
            navView.backgroundColor = .black
            let backButton = UIButton(type: .system)

            backButton.setTitle("Назад", for: .normal)
                   backButton.addTarget(self, action: #selector(onWebB), for: .touchUpInside)
            navView.addSubview(backButton)
                   
                   // Add constraints for the back button
                   backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 20).isActive = true
            backButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 10).isActive = true
                   backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
                   backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
        }
        let url = URL(string: urlString!)!
        let request = URLRequest(url: url)
        webPage.load(request)
        
        loader.style = .large
              loader.center = view.center
              view.addSubview(loader)

              loader.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
         loader.startAnimating()
     }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loader.stopAnimating()
    }
    
    func showRat(){
        if #available(iOS 14, *){
            
            
            if let scene = UIApplication.shared.connectedScenes.first as?
                UIWindowScene  {
                SKStoreReviewController.requestReview(in: scene)
                
                
            }
        } else {
            
            
            SKStoreReviewController.requestReview()
            
            
        }
    }


}

