import UIKit

// https://randomuser.me/api/

class ViewController: UIViewController {

    let buttonRandom: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25.0
        button.setTitle("Random User", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setConstraints()
    }
}

extension ViewController {
    
    func setConstraints(){
        self.view.addSubview(self.buttonRandom)
        NSLayoutConstraint.activate([
            buttonRandom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            buttonRandom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonRandom.widthAnchor.constraint(equalToConstant: 300),
            buttonRandom.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func buttonTapped(){
        print("Lol")
    }
    
}
