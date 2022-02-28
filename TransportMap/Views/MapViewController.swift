//
//  ViewController.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

import UIKit
import MapKit
import FloatingPanel

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    var mapViewModel: MapViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceMark()
        setupFloatingPanel()
    }
    
    @IBAction func closeMapButton() {
        dismiss(animated: true)
    }
    private func setupPlaceMark() {
        guard let latitude = mapViewModel?.latitude,
              let longitude = mapViewModel?.longitude else { return }
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = mapViewModel?.name
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate,
                                                  latitudinalMeters: 500,
                                                  longitudinalMeters: 500)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
    }
}

extension MapViewController: FloatingPanelControllerDelegate {
    func setupFloatingPanel() {
        let fpc = FloatingPanelController()
        fpc.delegate = self
        guard let routesVC = storyboard?.instantiateViewController(withIdentifier: "fpController") as? RoutesListViewController else { return }
        routesVC.routesListViewModel = mapViewModel?.viewModelForRoutesList()
        fpc.set(contentViewController: routesVC)
        fpc.addPanel(toParent: self)
    }
}
