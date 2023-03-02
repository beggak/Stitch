import Foundation
import UIKit

internal class MoviesController: BaseViewController<MoviesView, MoviesViewModel> {
    lazy var dataSource = MoviesTableViewDataSource.dataSource(contentView.tableView)
}
