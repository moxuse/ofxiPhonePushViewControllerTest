#include "ofMain.h"
#include "testApp.h"

int main(){
    ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
    ofPtr<ofBaseApp> ptr = ofPtr<ofBaseApp>(new testApp());
    ofRunApp(ptr);
}
