import UIKit

class DetailViewController: UIViewController, ViewSpecificController {
    typealias RootView = DetailView
    
    var presenter: DetailViewPresenterProtocol?
    
    override func loadView() {
        view =  DetailView()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setUI() {
        view().daLabel.text = presenter?.entries.da
        view().dmLabel.text = presenter?.entries.dm
        view().bodyTextView.text = presenter?.entries.body
    }
}
