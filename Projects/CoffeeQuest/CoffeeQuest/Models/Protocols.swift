import Foundation
import MapKit
import YelpAPI

protocol SearchResultsProtocol {
    func adaptSearchResultsFromYLP() -> SearchResults
}

protocol BusinessProtocol {
    func adaptBusinessFromYLP() -> Business
}

public struct SearchResults {
    var businesses: [Business]
    var total: UInt
}

public struct Business {
    var name: String
    var rating: Double
    var location: CLLocationCoordinate2D
}

extension YLPLocation {
    func getCoordinateFromYLP() -> CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(self.coordinate!.latitude, self.coordinate!.longitude)
    }
}

extension YLPBusiness: BusinessProtocol {
    func adaptBusinessFromYLP() -> Business {
        Business(name: self.name, rating: self.rating, location: self.location.getCoordinateFromYLP())
    }
}

extension YLPSearch: SearchResultsProtocol {
    func adaptSearchResultsFromYLP() -> SearchResults {
        let businesses = self.businesses.map { (business: YLPBusiness) in
                business.adaptBusinessFromYLP()
            }
        
        return SearchResults(businesses: businesses, total: self.total)
    }
}
