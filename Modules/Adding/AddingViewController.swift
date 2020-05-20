import UIKit

class AddingViewController: UIViewController, ViewSpecificController {
    typealias RootView = AddingView
    
    var presenter: AddingPresenterProtocol?
    
    override func loadView() {
        view = AddingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension AddingViewController: AddingViewProtocol {
    
}
