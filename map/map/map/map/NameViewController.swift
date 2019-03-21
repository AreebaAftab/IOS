//
//  NameViewController.swift
//  map
//
//  Created by user147466 on 3/14/19.
//  Copyright © 2019 user147466. All rights reserved.
//

import UIKit
import MapKit

final class SchoolAnnotation: NSObject, MKAnnotation{
    var coordinate :CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    
    init(coordinate : CLLocationCoordinate2D, title : String? , subtitle : String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
}
class NameViewController: UIViewController {

    //@IBOutlet weak var nameLabel: UILabel!
    
    //@IBOutlet weak var nameLabel1: UILabel!
    var finalName = ""
    var finalName1 = ""
    lazy var myFloat = (finalName as NSString).floatValue
    lazy var myFloat1 = (finalName1 as NSString).floatValue
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameLabel.text = finalName
        //nameLabel1.text = finalName1
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier )
        let mitCoordinate = CLLocationCoordinate2D(latitude:CLLocationDegrees(myFloat),longitude: CLLocationDegrees(myFloat1))
        let mitAnnotation = SchoolAnnotation(coordinate: mitCoordinate, title: "HERE", subtitle: "")
        mapView.addAnnotation(mitAnnotation)        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let schoolAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            schoolAnnotationView.animatesWhenAdded = true
            schoolAnnotationView.titleVisibility = .adaptive
            schoolAnnotationView.titleVisibility = .adaptive
            return schoolAnnotationView
        }
        return nil
    }
}
