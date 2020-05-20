import UIKit

protocol AddingViewProtocol: AnyObject {
    
}
@objc protocol AddingPresenterProtocol: AnyObject {
    @objc func saveButtonClick()
}


class AddingPresenter: AddingPresenterProtocol {
    
    let view: AddingViewProtocol?
    
    init(view: AddingViewProtocol) {
        self.view = view
    }
    
    @objc func saveButtonClick() {
        
    }
    
}
