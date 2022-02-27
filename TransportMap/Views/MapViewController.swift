//
//  ViewController.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    var mapViewModel: MapViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceMark()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showBottomSheet()
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
    
    func showBottomSheet() {
        guard let bottomVC = storyboard?.instantiateViewController(withIdentifier: "bottomSheet") as? BottomSheetViewController else { return }
        if let sheet = bottomVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        present(bottomVC, animated: true)
    }
}

