import UIKit

class DetailViewController: UIViewController, ViewSpecificController {
    typealias RootView = DetailView
    
    var presenter: DetailViewPresenterProtocol?
    
    override func loadView() {
        view =  DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DetailViewController: DetailViewProtocol {
    func setUI() {
        DispatchQueue.main.async {
            self.view().daLabel.text = self.presenter?.entries.da
            self.view().dmLabel.text = self.presenter?.entries.dm
            self.view().bodyTextView.text = self.presenter?.entries.body
        }
    }
}
