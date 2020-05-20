import UIKit

class MainViewController: UIViewController, ViewSpecificController {
    typealias RootView = MainView
    

    var presenter: MainPresenterProtocol?
    
    override func loadView() {
        view =  MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().tableView.delegate = self
        view().tableView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        let addPostButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
        navigationItem.rightBarButtonItem = addPostButton
    }

    @objc func addPost() {
        presenter?.present()
    }

}

extension MainViewController: MainViewProtocol {
    func success() {
        view().tableView.reloadData()
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//presenter?.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        //cell.configure(posts: presenter?.posts?[indexPath.row])
        //cell.textLabel?.text = presenter?.posts?[indexPath.row].postText
        return cell
    }
    
    
}
