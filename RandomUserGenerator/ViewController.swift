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

    let imageUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let user = UserInfo()
        
        setConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            print(user.name)
            print(user.age)
            print(user.email)
            print(user.address)
            print(user.phoneNumber)
            print(user.image)
        }
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
    
    func        setImage(_ user: UserInfo){
        let url: URL? = URL(string: user.image!)
        DispatchQueue.global().async{
            guard let data = try? Data(contentsOf: url!) else {
                return
            }
            DispatchQueue.main.async {
                self.imageUser.image = UIImage(data: data)
            }
        }


    }
    
    @objc func buttonTapped(){
        print("Lol")
    }
    
}
