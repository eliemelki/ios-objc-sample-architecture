//
//  PlacesViewController.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PlacesViewController.h"
#import <UIModule/UIModule.h>
#import <MapKit/MapKit.h>

@interface MKCustomAnnotation : MKPointAnnotation

@property (nonatomic, strong) Place *place;

@end



@interface PlacesViewController() <MKMapViewDelegate>

@property (nonatomic, strong) NSArray<Place *> *data;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation PlacesViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    [self.presenter setView:self];
    
}

#pragma mark - PaymentsView
- (void) showPlaces:(NSArray<Place *> *)payments {
    self.data = payments;
    [self reloadMap];
}

- (void)showLoginError:(NSString *)text {
    [self showError:text];
}

- (void) showLoading {
    [self.view.window showLoading];
}

- (void) hideLoading {
    [self.view.window hideLoading];
}



#pragma mark - UITableViewDataSource



#pragma mark - Private

- (void) configureUI {
    self.mapView.delegate = self;
}

- (void) reloadMap
{

    //Create annotations
    [self.mapView removeAnnotations:self.mapView.annotations];
    for (Place *place in self.data)
    {
        MKCustomAnnotation *annotation = [[MKCustomAnnotation alloc] init];
        [annotation setTitle:[place name]];
        CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(place.placeLocation.lat, place.placeLocation.lng);
        [annotation setCoordinate:coordinates];
        
        [annotation setPlace:place];
        [self.mapView addAnnotation:annotation];
    }
    
    //Center map to the first place location
    
    if ([self.data count] > 0) {
        Place *place = [self.data objectAtIndex:0];
        PlaceLocation *placelocation = place.placeLocation;
        CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(placelocation.lat, placelocation.lng);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(coordinates, 15000, 15000)];
        [self.mapView setRegion:adjustedRegion animated:YES];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.canShowCallout = YES;
    return annotationView;
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    MKCustomAnnotation *customAnnotation =  (MKCustomAnnotation *)view.annotation;
    [self.router navigateToRentPlace:customAnnotation.place];
}

@end

@implementation MKCustomAnnotation

@end



