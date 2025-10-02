//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by bayley on 9/23/25.
//

//import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController{
    var mapView: MKMapView!
    
    override func loadView(){
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        // Segmented Controls
        let segmentedControl
        = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor =  UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        
        // Define Constraints
        let topConstraint =
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
        segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
        segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        // Activate Contraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        
        //Point of interest Label
        let pointsOfInterestLabel = UILabel()
        pointsOfInterestLabel.text = "Points of Interest"
        pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestLabel)
        //Point of Interest Switch
        let pointsOfInterestSwitch = UISwitch()
        pointsOfInterestSwitch.isOn = true
        pointsOfInterestSwitch.addTarget(self,
                                         action: #selector(togglePointsOfInterest(_:)),
                                         for: .valueChanged)
        pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestSwitch)
        
        
        let pointsOfInterestLabelTopConstraint =
        pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12)
        let pointsOfInterestLabelLeadingConstraint =
        pointsOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 12)
        
        // Define the switch constraints
        let pointsOfInterestSwitchCenterYConstraint =
        pointsOfInterestSwitch.centerYAnchor.constraint(equalTo: pointsOfInterestLabel.centerYAnchor)
        
        let pointsOfInterestSwitchLeadingConstraint =
        pointsOfInterestSwitch.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 12)
        
        // Activate Constaints
        pointsOfInterestLabelTopConstraint.isActive = true
        pointsOfInterestLabelLeadingConstraint.isActive = true
        pointsOfInterestSwitchCenterYConstraint.isActive = true
        pointsOfInterestSwitchLeadingConstraint.isActive = true
        /*
        pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12).isActive = true
        pointsOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 12).isActive = true
        
        pointsOfInterestSwitch.centerYAnchor.constraint(equalTo: pointsOfInterestLabel.centerYAnchor).isActive = true
        pointsOfInterestSwitch.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 12).isActive = true
         */
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    // Case function for segmentedControl
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
                    
    @objc func togglePointsOfInterest(_ sender: UISwitch){
        if sender.isOn{
            mapView.pointOfInterestFilter = .includingAll
        } else{
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
}

