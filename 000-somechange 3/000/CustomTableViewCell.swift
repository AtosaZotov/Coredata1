
import UIKit

class CustomTableViewCell: UITableViewCell {
    static let cellIdentity = "CustomTableViewCell"
    var button: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.button = UIButton(type: .system)
        button.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: contentView.bounds.width - 50, y: (contentView.bounds.height-30)/2, width: 30, height: contentView.bounds.height - 10)
        textLabel?.frame = CGRect(x: 10, y: (contentView.bounds.height-40)/2, width: contentView.bounds.width / 2, height: contentView.bounds.height - 10)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        print(sender.tag)
    }
}
