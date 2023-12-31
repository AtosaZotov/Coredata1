
import UIKit
import CoreData

protocol AddViewControllerDelegate: AnyObject {
    func didAddedMemebrToDB(_: AddViewController)
}

class AddViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak var delegate: AddViewControllerDelegate?
    
    private let textFild: UITextField = {
        let custom = UITextField()
        custom.borderStyle = .roundedRect
        custom.placeholder = "Please Enter ..."
        return custom
    }()
    
    private let saveButton: UIButton = {
        let custom = UIButton()
        custom.backgroundColor = .systemBlue
        custom.layer.cornerRadius = 10
        custom.layer.masksToBounds = true
        custom.setTitle("Save", for: .normal)
        return custom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New"
        view.backgroundColor = .darkGray
        
        view.addSubview(textFild)
        
        saveButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
    }
    
    override func viewDidLayoutSubviews() {
        let textFieldX = view.bounds.width/8
        textFild.frame = CGRect(x: textFieldX, y: view.bounds.height/3, width: view.bounds.width - (textFieldX*2), height: 50)
        saveButton.showsTouchWhenHighlighted = true
        saveButton.isUserInteractionEnabled = true
        saveButton.frame = CGRect(x: (view.bounds.width-200)/2, y: view.bounds.height - 200, width: 200, height: 50)
    }
    
    @objc func addButtonTapped() {
        if !textFild.isReallyEmpty {
            let newMem = Members(context: self.context)
            newMem.member = textFild.text
            newMem.accessory = true
            saveData()
        }
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("error in save \(error)")
        }
        delegate?.didAddedMemebrToDB(self)
    }
}


extension UITextField {
    var isReallyEmpty: Bool {
        return self.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }
}
