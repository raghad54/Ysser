//
//  MapViewController.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/20/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit
import MapKit



protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    
    
    
    
    var myRoute : MKRoute?
    var directionsRequest = MKDirections.Request()
     var placemarks = [MKMapItem]()
    
    var selectedPin:MKPlacemark? = nil
    let locationManager = CLLocationManager()
    var resultSearchController:UISearchController? = nil
    
    
    
    let coords = [CLLocation(latitude: 25.344676, longitude: 49.482476)
    ,CLLocation(latitude: 25.229816, longitude: 55.305189),
    CLLocation(latitude:  24.227811, longitude:39.550073),
    CLLocation(latitude: 21.388817, longitude: 39.275477), CLLocation(latitude: 21.392489, longitude: 39.859582)
    ,CLLocation(latitude: 21.478007, longitude: 39.183641)
    ,CLLocation(latitude: 24.697486, longitude: 46.686532)
    ,CLLocation(latitude: 24.697486, longitude: 46.686532),CLLocation(latitude: 24.697486, longitude: 46.686532)
    ,CLLocation(latitude: 24.020662, longitude: 38.204056)
    
    ]
    
     override func viewDidLoad() {
            super.viewDidLoad()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
            
           
            let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
            locationSearchTable.handleMapSearchDelegate = self

            resultSearchController = UISearchController(searchResultsController: locationSearchTable)
            resultSearchController?.searchResultsUpdater = locationSearchTable
            
            let searchBar = resultSearchController!.searchBar
            searchBar.sizeToFit()
            searchBar.placeholder = "Search for places"
            navigationItem.titleView = resultSearchController?.searchBar

            resultSearchController?.hidesNavigationBarDuringPresentation = false
            resultSearchController?.dimsBackgroundDuringPresentation = true
            definesPresentationContext = true
            
            locationSearchTable.mapView = mapView
            mapView.delegate = self
            addAnnotations(coords: coords)

        }
        
        @objc func getDirections(){
            if let selectedPin = selectedPin {
                let mapItem = MKMapItem(placemark: selectedPin)
                let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                mapItem.openInMaps(launchOptions: launchOptions)
            }
        }
    
    func addAnnotations(coords:[CLLocation]){
        for coord in coords{
            let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                      longitude: coord.coordinate.longitude);
            let anno = MKPointAnnotation();
            anno.coordinate = CLLCoordType;
            mapView.addAnnotation(anno);
        }

    }
}

    extension MapViewController : CLLocationManagerDelegate {
         func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                locationManager.requestLocation()
            }
        }
        
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                mapView.setRegion(region, animated: true)
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error:: (error)")
        }
    }

    extension MapViewController: HandleMapSearch {
        func dropPinZoomIn(placemark:MKPlacemark){
            // cache the pin
            selectedPin = placemark
            // clear existing pins
            mapView.removeAnnotations(mapView.annotations)
            let annotation = MKPointAnnotation()
            annotation.coordinate = placemark.coordinate
            annotation.title = placemark.name
            if let city = placemark.locality,
                let state = placemark.administrativeArea {
                annotation.subtitle = "\(city) \(state)"
            }

            placemarks.append(MKMapItem(placemark: placemark))
          
            directionsRequest.transportType = MKDirectionsTransportType.automobile
           
            //Draw polyline by using MKRoute so it follows the street roads...
            for (k, item) in placemarks.enumerated() {
                if k < (placemarks.count - 1) {
                    directionsRequest.source = item
                    directionsRequest.destination = placemarks[k+1]

              var directions = MKDirections(request: directionsRequest)
              directions.calculate { (response:MKDirections.Response!, error: Error!) -> Void in
                        if error == nil {
                            self.myRoute = response.routes[0] as? MKRoute
                            //self.mapView.addOverlay(self.myRoute?.polyline)
                            let geodesic:MKPolyline = self.myRoute!.polyline
                            self.mapView.addOverlay(geodesic)
                        }
                    }

                }
            }
            
            mapView.addAnnotation(annotation)
            let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05) //MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion.init(center: placemark.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }

    extension LocationSearchTable {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            let selectedItem = matchingItems[indexPath.row].placemark
            handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
            dismiss(animated: true, completion: nil)
        }
    }






    extension MapViewController : MKMapViewDelegate {
        func mapView(_: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                let placemarkSource = MKPlacemark(coordinate: annotation.coordinate, addressDictionary: nil)
                placemarks.append(MKMapItem(placemark: placemarkSource))
                return nil
            }
            let reuseId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.pinTintColor = UIColor.orange
            pinView?.canShowCallout = true
            let smallSquare = CGSize(width: 30, height: 30)
            let button = UIButton(frame: CGRect(origin: CGPoint(x: 0,y :0), size: smallSquare))
            button.setBackgroundImage(UIImage(named: "car"), for: .normal)
            button.addTarget(self, action: #selector(MapViewController.getDirections), for: .touchUpInside)
            pinView?.leftCalloutAccessoryView = button
            return pinView
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay.isKind(of: MKPolyline.self){
                    var polylineRenderer = MKPolylineRenderer(overlay: overlay)
                    polylineRenderer.fillColor = UIColor.blue
                    polylineRenderer.strokeColor = UIColor.blue
                    polylineRenderer.lineWidth = 2
                
                return polylineRenderer
         }
            return MKOverlayRenderer(overlay: overlay)
        }

    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        mapView.addAnnotation(annotation)
//
//        self.locationManager.requestAlwaysAuthorization()
//
//        // For use in foreground
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//           // locationManager.startUpdatingLocation()
//        }
//
//        mapView.delegate = self
//        mapView.mapType = .standard
//        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = true
//        mapView.userTrackingMode = .follow
//
//        if let coor = mapView.userLocation.location?.coordinate{
//            mapView.setCenter(coor, animated: true)
//        }
//          addPin()
//            addPinTow()
//          focusMapView()
//          addAnnotations(coords: coords)
//
//    }
//
//
    
//
//
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation{
//            return nil;
//        }else{
//            let pinIdent = "Pin";
//            var pinView: MKPinAnnotationView;
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
//                dequeuedView.annotation = annotation;
//                pinView = dequeuedView;
//            }else{
//                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
//
//            }
//            return pinView;
//        }
//    }
//
//
//    func addPin() {
//        let annotationFirstPlace = MKPointAnnotation()
//        let centerCoordinate = CLLocationCoordinate2D(latitude: 18.273497, longitude:42.806190)
//        annotationFirstPlace.coordinate = centerCoordinate
//        annotationFirstPlace.title = "Lanai, Hawaii"
//        mapView.addAnnotation(annotationFirstPlace)
//
//    }
//
//    func addPinTow() {
//        let annotationSecondPlace = MKPointAnnotation()
//              let centerSecondCoordinate = CLLocationCoordinate2D(latitude: 29.117001, longitude:110.478996)
//              annotationSecondPlace.coordinate = centerSecondCoordinate
//              annotationSecondPlace.title = "Zhangjiajie, China"
//              mapView.addAnnotation(annotationSecondPlace)
//    }
//
//    func focusMapView() {
//        let mapCenter = CLLocationCoordinate2DMake(25.344676, 49.482476)
//        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        let region = MKCoordinateRegion(center: mapCenter, span: span)
//        mapView.region = region
//    }
    
    //    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        let location = locations.last
    //
    //        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    //        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    //
    //        self.mapView.setRegion(region, animated: true)
    //    }
    //
    //
    


