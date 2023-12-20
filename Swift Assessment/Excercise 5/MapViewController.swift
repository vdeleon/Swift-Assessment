//
//  MapViewController.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var mapView: MKMapView!
    var location: LocationObject?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the mapView programmatically
        mapView = MKMapView()
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        // Configure constraints for the mapView
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        LocationService.shared.fetchLocation { [weak self] location in
            self?.location = location

            // Update UI on the main thread
            DispatchQueue.main.async {
                self?.addAnnotationToMap()
            }
        }
    }

    func addAnnotationToMap() {
        guard let location = location else {
            return
        }

        let coordinate = CLLocationCoordinate2D(latitude: Double(location.loc.components(separatedBy: ",").first!)!,
                                               longitude: Double(location.loc.components(separatedBy: ",").last!)!)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = location.city
        mapView.addAnnotation(annotation)

        // Zoom to the region
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: true)
    }

    // MARK: - MKMapViewDelegate
}
