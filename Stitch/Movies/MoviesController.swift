import Foundation
import UIKit

internal class MoviesController: BaseViewController<MoviesView, MoviesViewModel> {
    lazy var dataSource = MoviesTableViewDataSource.dataSource(contentView.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        contentView.tableView.rx.setDelegate(self).disposed(by: disposableBag)
    }
    
    private func bindViewModel() {
//        let input = MoviesViewModel.Input(itemSelected: contentView.tableView.rx.itemSelected.asDriver())
//        let ouput = viewModel.transform(input: input)
    }
}

extension MoviesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
