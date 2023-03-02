import UIKit
import SnapKit

internal class ImageWithTitle: Cell<Movie> {
    internal var imageLabel: UIImageView = .init()
    internal let titleLabel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func onConfigureView() {
        imageLabel.image = UIImage(named: "stitch")

        titleLabel.text = "Title"
        titleLabel.font = .systemFont(ofSize: 24)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        imageLabel.image = nil
        titleLabel.text = nil
    }
    
    open override func configure(with data: Movie) {
        imageLabel.image = UIImage(named: data.image)
        titleLabel.text = data.title
    }
    
    public override func onAddSubviews() {
        [imageLabel, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    public override func setupConstraints() {
        
        imageLabel.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).offset(16)
            $0.top.equalTo(contentView.snp.top).offset(8)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-8)
            $0.width.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(imageLabel.snp.right).offset(8)
            $0.right.equalTo(contentView.snp.right).offset(-8)
            $0.centerY.equalTo(imageLabel.snp.centerY)
        }
    }
}
