import UIKit

// https://randomuser.me/api/

struct Interface{
	var name: String?
	var email: String?
	var age: Int?
	var address: String?
	var phoneNumber: String?
	var image: String?
}

class ViewController: UIViewController {
    
	private var userObject = User()
	
	lazy var interface = Interface()
	
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
		
		self.userObject.getData()
		userObject.completionHandler = { user in
			self.interface.name = user.name
			self.interface.address = user.address
			self.interface.email = user.email
			self.interface.age = user.age
			self.interface.phoneNumber = user.phoneNumber
			self.interface.image = user.image
		}
		setInterface()
		setConstraints()
    }
    
    
}

extension ViewController {
	    
	func setInterface(){
		self.imageUser.image = UIImage()
	}
	
    func setConstraints(){
        self.view.addSubview(self.buttonRandom)
        NSLayoutConstraint.activate([
            buttonRandom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            buttonRandom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonRandom.widthAnchor.constraint(equalToConstant: 300),
            buttonRandom.heightAnchor.constraint(equalToConstant: 50)
        ])
		
		self.view.addSubview(imageUser)
		NSLayoutConstraint.activate([
			imageUser.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
			imageUser.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//			imageUser.widthAnchor.constraint(equalToConstant: 75),
//			imageUser.heightAnchor.constraint(equalToConstant: 40)
		
		])
        
    }

	@objc func buttonTapped(){
		self.userObject.getData()
		userObject.completionHandler = { user in
			self.interface.name = user.name
			self.interface.address = user.address
			self.interface.email = user.email
			self.interface.age = user.age
			self.interface.phoneNumber = user.phoneNumber
			self.interface.image = user.image
		}
//		print(self.interface.name)
//		print(self.interface.address)
//		print(self.interface.email)
//		print(self.interface.age)
//		print(self.interface.phoneNumber)
//		print(self.interface.image)
	}
	
}
