#include "testApp.h"

static dispatch_once_t onceToken;

//--------------------------------------------------------------
void testApp::setup(){
    ofxAccelerometer.setup();
    
    ofRegisterTouchEvents(this);

    ofxiPhoneAlerts.addListener(this);
    
    subViewController = [[UIViewController alloc] init];
    
    subViewController.title = @"Second View Controller";
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    
    dispatch_once(&onceToken, ^{
        UIWindow * window = ofxiPhoneGetUIWindow();
        
        UIViewController *firstViewController = ofxiPhoneGetViewController();
        
        firstViewController.title = @"First View Controller";
        
        window.rootViewController = subViewController;
        
        navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        
        window.rootViewController = navigationController;
    });
    
    ofSetColor(0, 0, 0);
    ofDrawBitmapString("This is ofxiPhoneGLView.. \nTouch and Push viewController", 10, ofGetHeight() / 2 - 50 );
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    /*
    touch window to push viewController..
    */
    
    [navigationController pushViewController:subViewController animated:YES];
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

