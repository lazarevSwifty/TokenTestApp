import UIKit

class AddingView: UIView {
    
    let textView =  UITextView()
    let cancelButton = UIButton()
    let saveButton = UIButton()
    
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
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        cancelButton.backgroundColor = .lightGray
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.layer.cornerRadius = 10
        cancelButton.setTitle("Отменить", for: .normal)
        saveButton.backgroundColor = .lightGray
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.layer.cornerRadius = 10
        
        addSubview(textView)
        addSubview(cancelButton)
        addSubview(saveButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leftAnchor.constraint(equalTo: leftAnchor),
            textView.rightAnchor.constraint(equalTo: rightAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0),
            cancelButton.leftAnchor.constraint(equalTo: leftAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            cancelButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor, multiplier: 1),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0),
            saveButton.leftAnchor.constraint(equalTo: cancelButton.rightAnchor, constant: 10),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            saveButton.heightAnchor.constraint(equalTo: cancelButton.heightAnchor, multiplier: 1)
        ])
    }
}
