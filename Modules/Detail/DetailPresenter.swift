import UIKit
import Foundation

protocol DetailViewProtocol: AnyObject {
    func setUI()
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, entries: EntriesData)
    func setUI()
    var entries: EntriesData {get}
}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    var entries: EntriesData

    required init(view: DetailViewProtocol, entries: EntriesData) {
        self.view = view
        self.entries = entries
        setUI()
    }
    
    func setUI() {
        DispatchQueue.main.async {
            self.view?.setUI()
        }
    }
}


