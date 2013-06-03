#include "testApp.h"

static dispatch_once_t onceToken;

//--------------------------------------------------------------
void testApp::setup(){
    ofxAccelerometer.setup();
    
    ofRegisterTouchEvents(this);

    ofxiPhoneAlerts.addListener(this);
    
    subViewController = [[UIViewController alloc] init];
    
    subViewController.title = @"Second View Controller";
    
    ofSetCircleResolution(50);
	ofBackground(255,255,255);
	bSmooth = false;
}

//--------------------------------------------------------------
void testApp::update(){
    counter = counter + 0.033f;
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
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.1f * NSEC_PER_SEC);
        dispatch_after(delay, dispatch_get_main_queue(), ^{
            [[(ofxiPhoneViewController*)firstViewController glView] startAnimation]; // GLViewがstopしてしまうのでstartを少し遅れて呼ぶ
        });
        
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

