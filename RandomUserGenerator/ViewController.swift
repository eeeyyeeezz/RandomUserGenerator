// https://randomuser.me/api/

import UIKit


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
		
		image.layer.cornerRadius = 75
		image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(25)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let emailLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(25)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let ageLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(25)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let addressLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(25)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let phoneNumberLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(25)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
		
		self.userObject.getData()
		userObject.completionHandler = { user in
			DispatchQueue.main.async {
				self.interface.name = user.name
				self.interface.address = user.address
				self.interface.email = user.email
				self.interface.age = user.age
				self.interface.phoneNumber = user.phoneNumber
				self.interface.image = user.image
			}
			DispatchQueue.main.async {
				self.setInterface()
				self.setConstraints()
			}
		}
		
    }
    
    
}

extension ViewController {
	    
	func setInterface(){
		let url = URL(string: self.interface.image!)
		if let data = try? Data(contentsOf: url!) {
			if let image = UIImage(data:data){
				DispatchQueue.main.async {
					self.imageUser.image = image
				}
			}
		}
		
		self.nameLabel.text = self.interface.name
		self.emailLabel.text = self.interface.email
		self.ageLabel.text = "Age: " + String(self.interface.age!)
		self.addressLabel.text = self.interface.address
		self.phoneNumberLabel.text = self.interface.phoneNumber
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
			imageUser.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
			imageUser.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			imageUser.widthAnchor.constraint(equalToConstant: 300),
			imageUser.heightAnchor.constraint(equalToConstant: 250)
		])
		
		self.view.addSubview(nameLabel)
		nameLabel.topAnchor.constraint(equalTo: self.imageUser.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(nameLabel)
		
		self.view.addSubview(emailLabel)
		emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(emailLabel)
		
		self.view.addSubview(ageLabel)
		ageLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(ageLabel)

		self.view.addSubview(addressLabel)
		addressLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(addressLabel)

		self.view.addSubview(phoneNumberLabel)
		phoneNumberLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 20).isActive = true
		setLabelConstraints(phoneNumberLabel)
        
    }

	func			setLabelConstraints<Label: UILabel> (_ someLabel: Label){
		NSLayoutConstraint.activate([
			someLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			someLabel.widthAnchor.constraint(equalToConstant: 350),
			someLabel.heightAnchor.constraint(equalToConstant: 50)
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
		setInterface()
	}
	
}
