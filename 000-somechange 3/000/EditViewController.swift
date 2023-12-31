
import UIKit
import CoreData

protocol EditViewControllerDelegate: class {
    func didEdited(_: EditViewController, editedText: String, index: Int)
}

class EditViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var memebr: String?
    var index: Int?
    var delegate: EditViewControllerDelegate?
    
    private let textFild: UITextField = {
        let custom = UITextField()
//        custom.layer.borderWidth = 1
//        custom.layer.borderColor = UIColor.black.cgColor
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
    
    init(memebr: String? = nil, index: Int? = nil) {
        self.memebr = memebr
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        view.backgroundColor = .darkGray
        
        textFild.text = memebr
        view.addSubview(textFild)
        
        saveButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
    }
    
    override func viewDidLayoutSubviews() {
        let textFieldX = view.bounds.width/8
        textFild.frame = CGRect(x: textFieldX, y: view.bounds.height/3, width: view.bounds.width - (textFieldX*2), height: 50)
        saveButton.showsTouchWhenHighlighted = true
        saveButton.isUserInteractionEnabled = true
        saveButton.frame = CGRect(x: (view.bounds.width-200)/2, y: view.bounds.height - 200, width: 200, height: 50)
    }
    
    @objc func editButtonTapped() {
        if !textFild.isReallyEmpty {
            print(textFild.text)
            if delegate == nil {
                print("nil")
            }
            delegate?.didEdited(self, editedText: textFild.text!, index: index!)
        }
    }
}
