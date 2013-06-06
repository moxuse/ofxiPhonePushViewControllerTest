//
//  Node.h
//  ofxiPhonePushViewControllerTest
//
//  Created by Koichiro Mori on 2013/06/06.
//
//

#ifndef ofxiPhonePushViewControllerTest_Node_h
#define ofxiPhonePushViewControllerTest_Node_h

#import "ofMain.h"

class Node {

public:
    Node() {
        iD = NULL;
        position = ofVec3f(0, 0, 0);
    };
    
    int iD;
    ofVec3f position;

    void draw() {
        ofBox(position.x, position.y, position.z, 5);
    };
};

#endif
