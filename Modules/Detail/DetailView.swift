import UIKit

class DetailView: UIView {
    let daLabel = UILabel()
    let dmLabel = UILabel()
    let bodyTextView = UITextView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        backgroundColor = .white
        daLabel.translatesAutoresizingMaskIntoConstraints = false
        dmLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(daLabel)
        stackView.addArrangedSubview(dmLabel)
        addSubview(stackView)
        addSubview(bodyTextView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            
            bodyTextView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            bodyTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            bodyTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            bodyTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
}
