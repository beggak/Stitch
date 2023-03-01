import RxSwift
import RxDataSources
import Foundation

struct MoviesSectionModel {
    var header: String
    var items: [Movie]
}

extension MoviesSectionModel: SectionModelType {
    typealias Item = Movie
    
    init(original: MoviesSectionModel, items: [Movie]) {
        self = original
        self.items = items
    }
}

struct MoviesTableViewDataSource {
    typealias MoviesDataSource = RxTableViewSectionedReloadDataSource<MoviesSectionModel>
    
    static func dataSource(_ tableView: UITableView) -> MoviesDataSource {
        return MoviesDataSource.init { dataSource, tableView, indexPath, item in
            tableView.register(ImageTitleSubtitle.self,
                               forCellReuseIdentifier: String(describing: ImageTitleSubtitle.self))
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageTitleSubtitle.self),
                                                     for: indexPath) as! ImageTitleSubtitle
            cell.configure(with: item)
            return cell
        } titleForFooterInSection: { dataSource, index in
            return dataSource.sectionModels[index].header
        }
    }
}
