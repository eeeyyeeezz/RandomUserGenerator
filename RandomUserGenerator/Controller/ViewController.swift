// https://randomuser.me/api/

import UIKit


class ViewController: UIViewController {
    
	private var userObject = User()
	
	private var interface = Interface()
	
    lazy var buttonRandom: UIButton = {
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
        view.backgroundColor = .white
		
		userObject.getData()
		userObject.completionHandler = { user in
			DispatchQueue.main.async {
				self.interface.name = user.name
				self.interface.address = user.address
				self.interface.email = user.email
				self.interface.age = user.age
				self.interface.phoneNumber = user.phoneNumber
				self.interface.image = user.image
				self.setInterface()
				self.setConstraints()
			}
		}
    }
}

extension ViewController {
	    
	func setInterface(){
		let url = URL(string: self.interface.image!)
		DispatchQueue.global().async {
			if let data = try? Data(contentsOf: url!) {
				if let image = UIImage(data:data) {
					DispatchQueue.main.async { [weak self] in
						self?.imageUser.image = image
					}
				}
			}
		}
		
		nameLabel.text = interface.name
		emailLabel.text = interface.email
		ageLabel.text = "Age: " + String(interface.age!)
		addressLabel.text = interface.address
		phoneNumberLabel.text = interface.phoneNumber
	}	
	
	@objc func buttonTapped(){
		userObject.getData()
		userObject.completionHandler = { [weak self] user in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.interface.name = user.name
				self.interface.address = user.address
				self.interface.email = user.email
				self.interface.age = user.age
				self.interface.phoneNumber = user.phoneNumber
				self.interface.image = user.image
				self.setInterface()
			}
		}
	}
	
}
