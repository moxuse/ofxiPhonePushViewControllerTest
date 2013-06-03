#include "testApp.h"

static dispatch_once_t onceToken;

//--------------------------------------------------------------
void testApp::setup(){
    ofxAccelerometer.setup();
    
    ofRegisterTouchEvents(this);

    ofxiPhoneAlerts.addListener(this);
    
    subViewController = [[UIViewController alloc] init];
    
    subViewController.title = @"Second View Controller";
    
    ofSetWindowTitle("graphics example");
    
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
            [[(ofxiPhoneViewController*)firstViewController glView] startAnimation];
        });
        
    });
    
    ofScale(0.3, 0.3);
    
    //--------------------------- circles
	//let's draw a circle:
	ofSetColor(255,130,0);
	float radius = 50 + 10 * sin(counter);
	ofFill();		// draw "filled shapes"
	ofCircle(100,400,radius);
    
	// now just an outline
	ofNoFill();
	ofSetHexColor(0xCCCCCC);
	ofCircle(100,400,80);
    
	// use the bitMap type
	// note, this can be slow on some graphics cards
	// because it is using glDrawPixels which varies in
	// speed from system to system.  try using ofTrueTypeFont
	// if this bitMap type slows you down.
	ofSetHexColor(0x000000);
	ofDrawBitmapString("circle", 75,500);
    
    
	//--------------------------- rectangles
	ofFill();
	for (int i = 0; i < 200; i++){
		ofSetColor((int)ofRandom(0,255),(int)ofRandom(0,255),(int)ofRandom(0,255));
		ofRect(ofRandom(250,350),ofRandom(350,450),ofRandom(10,20),ofRandom(10,20));
	}
	ofSetHexColor(0x000000);
	ofDrawBitmapString("rectangles", 275,500);
    
	//---------------------------  transparency
	ofSetHexColor(0x00FF33);
	ofRect(400,350,100,100);
	// alpha is usually turned off - for speed puposes.  let's turn it on!
	ofEnableAlphaBlending();
	ofSetColor(255,0,0,127);   // red, 50% transparent
	ofRect(450,430,100,33);
	ofSetColor(255,0,0,(int)(counter * 10.0f) % 255);   // red, variable transparent
	ofRect(450,370,100,33);
	ofDisableAlphaBlending();
    
	ofSetHexColor(0x000000);
	ofDrawBitmapString("transparency", 410,500);
    
	//---------------------------  lines
	// a bunch of red lines, make them smooth if the flag is set
    
	if (bSmooth){
		ofEnableSmoothing();
	}
    
	ofSetHexColor(0xFF0000);
	for (int i = 0; i < 20; i++){
		ofLine(600,300 + (i*5),800, 250 + (i*10));
	}
    
	if (bSmooth){
		ofDisableSmoothing();
	}
    
	ofSetHexColor(0x000000);
	ofDrawBitmapString("lines\npress 's' to toggle smoothness", 600,500);
    
    
    
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

