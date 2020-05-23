import UIKit

protocol AddingViewProtocol: AnyObject {
    func getBodyText()
    func showErrorAlert()
    func showSuccesAlert()
    func dismissVC()
}
@objc protocol AddingPresenterProtocol: AnyObject {
    @objc func saveButtonClick()
    @objc func cancelButtonClick()
    var bodyText: String? {get set}
}

class AddingPresenter: AddingPresenterProtocol {
    let view: AddingViewProtocol?
    let networkService: NetworkService?
    var bodyText: String?
    
    init(view: AddingViewProtocol, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    @objc func cancelButtonClick() {
        view?.dismissVC()
    }
    
    @objc func saveButtonClick() {
        view?.getBodyText()
        if let text = bodyText, text.count > 0 {
            if let session = UserSettings.getSession() {
                self.networkService?.addEntry(body: text,session: session, completion: {[weak self] data in
                    DispatchQueue.main.async {
                        self?.view?.showSuccesAlert()
                    }
                })
            }
        } else {
            view?.showErrorAlert()
        }
    }
}
