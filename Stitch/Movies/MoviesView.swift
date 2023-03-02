import UIKit
import SnapKit

public class MoviesView: BaseView {
    internal var tableView: UITableView!
    
    override public func setUpView() {
        super.setUpView()
        tableView = UITableView.init()
        addSubview(tableView)
    }
    
    override public func setUpConstraints() {
        super.setUpConstraints()
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalTo(0)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
