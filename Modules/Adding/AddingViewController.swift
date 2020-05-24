import UIKit

class AddingViewController: UIViewController, ViewSpecificController {
    typealias RootView = AddingView
    
    var presenter: AddingPresenterProtocol?
    override func loadView() {
        view = AddingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().textView.delegate = self
        
        view().cancelButton.addTarget(presenter, action: #selector(presenter?.cancelButtonClick), for: .touchUpInside)
        view().saveButton.addTarget(presenter, action: #selector(presenter?.saveButtonClick), for: .touchUpInside)
    }
}

extension AddingViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension AddingViewController: AddingViewProtocol {
    func showSuccesAlert() {
        showAlert(alertText: Constants.alertText, alertMessage: Constants.alertMessage, title: Constants.alertTitle)
        view().textView.text = ""
    }
    
    func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    func showErrorAlert() {
        showAlert(alertText: Constants.alertError, alertMessage: Constants.alertErrorMes, title: Constants.alertTitle)
    }
    
    func getBodyText() {
        presenter?.bodyText = view().textView.text
    }
}
