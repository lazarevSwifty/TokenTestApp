import UIKit
protocol MainRouterProtocol: AnyObject {
    func goToAddingVC()
}

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    //weak var moduleOutput: SecondModuleOutput?
    func goToAddingVC() {
        let vc = ModelBuilder.createAddingModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
