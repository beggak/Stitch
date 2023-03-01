import UIKit

open class Cell<Model>: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        onConfigureView()
        onAddSubviews()
        setupConstraints()
    }
        
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func onConfigureView() { }
    
    open func configure(with data: Model) { }

    open func onAddSubviews() { }
    
    open func setupConstraints() { }
}
