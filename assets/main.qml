import bb.cascades 1.2
import bb.system 1.2


NavigationPane {
    id: navigationPane    
Page {
        id: singlecamview
        Container {
            id: maincontainer
            background: Color.White

            //Container for the monitor
            Container {
                id: viewer
                layout: DockLayout {
                
                }

                    WebView {
                        id: svwebview

                        contextMenuHandler: ContextMenuHandler { //disable the context only in liveview
                            onPopulating: {
                                if (capture.visible){
                                    event.abort();
                                }
                                
                            }
                        } 
                        
                        settings.zoomToFitEnabled: true
                        settings.background: Color.Black
                        settings.activeTextEnabled: true
                        
                        onCreationCompleted: {
                            settings.setCamName.objectName = "cam1Name"
                            settings.setIPAddress.objectName = "cam1IP"
                            settings.setextIPAddress.objectName = "cam1extIP"
                            settings.setPort.objectName = "cam1Port"
                            
                            
                            
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                svwebview.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"    
                            }
                            else{                        
                                svwebview.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                                //Below URL flickers the video
                                //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                            }                   
                        }
                        
                        onLoadingChanged: {
                            svactindicator.running = false
                            svactindicator.enabled = false
                        }
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    
                    }//end of webview


                Label {
                    id: cameraDescription
                    //text: _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                    opacity: 0.5
                    textStyle.color: Color.create("#ff00bfff")
                    horizontalAlignment: HorizontalAlignment.Left
                    translationX: 10.0

                }
                ActivityIndicator {
                    id: svactindicator
                    enabled: false

                    scaleX: 1.0
                    scaleY: 1.0
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    running: true

                }
            

                scaleX: 0.95
                scaleY: 0.95
                background: Color.White
                
                Container { // implemented to show the arrows in landscape mode
                    id: viewer_controls_l
                    visible: false
                    layout: StackLayout {
                    
                    }
                    horizontalAlignment: HorizontalAlignment.Right
                    ImageButton {
                        id: upbutton_l
                        defaultImageSource: "asset:///images/up.PNG"
                        pressedImageSource: "asset:///images/navigationpressed.png"
                        scaleX: 0.5
                        scaleY: 0.5                        
                        onTouch: {
                            if (event.isDown()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=0[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=0[&next_url=]"
                                }
                            
                            }
                            if (event.isUp()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=1[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=1[&next_url=]"
                                }                           
                            }
                        }

                    }//End of upbutton
                    
                    ImageButton {
                        id: downbutton_l
                        defaultImageSource: "asset:///images/bottom.PNG"
                        pressedImageSource: "asset:///images/navigationpressed.png"
                        scaleX: 0.5
                        scaleY: 0.5
                        onTouch: {
                            if (event.isDown()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=2[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=2[&next_url=]"
                                }
                            
                            }
                            if (event.isUp()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=3[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=3[&next_url=]"
                                }                        
                            }                    
                        }
                    
                    }//end of down  button

                    ImageButton {
                        id: leftbutton_l
                        defaultImageSource: "asset:///images/left.PNG"
                        pressedImageSource: "asset:///images/navigationpressed.png"
                        scaleX: 0.5
                        scaleY: 0.5
                        onTouch: {
                            if (event.isDown()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=4[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=4[&next_url=]"
                                }                        
                            }
                            if (event.isUp()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=5[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=5[&next_url=]"
                                }                       
                            }                    
                        }
                    
                    }//end of left button
                    
                    ImageButton {
                        id: rightbutton_l
                        defaultImageSource: "asset:///images/right.PNG"
                        pressedImageSource: "asset:///images/navigationpressed.png"
                        scaleX: 0.5
                        scaleY: 0.5
                        onTouch: {
                            if (event.isDown()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=6[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=6[&next_url=]"
                                }                       
                            }
                            if (event.isUp()) {
                                if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=7[&next_url=]"    
                                }
                                else{
                                    webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=7[&next_url=]"
                                }                        
                            }                    
                        }

                    }//end of right button                
               }

            }// End  of container for monitor
            



//--------------------------
//Container for the controls
//--------------------------
            Container {
                id: snapshot
                visible: true
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight

                }
                background: Color.White

                ImageButton {
                    id: capture
                    defaultImageSource: "asset:///images/capture.PNG"
                    onClicked: {
                        _starshipApp.clearsnapshot();
                        console.log("Capture button is pressed")
                        //svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/snapshot.cgi" //[?admin=&bingo123=&next_url=]"
                        upbutton.visible = false
                        downbutton.visible = false
                        rightbutton.visible = false
                        leftbutton.visible = false
                        refresh.visible = true
                        capture.visible = false
                        camera1.visible = false
                        camera2.visible = false
                        camera3.visible = false
                        camera4.visible = false
                        shareLabel.visible = true
                        //sharelabel.visible = true
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false) {
                            svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/snapshot.cgi" //[?admin=&bingo123=&next_url=]"
                        } else {
                            svwebview.url = "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/snapshot.cgi" //[?admin=&bingo123=&next_url=]"
                        }
                    }
                    scaleX: 0.7
                    scaleY: 0.7

                }

                ImageButton {
                    id: camera1
                    defaultImageSource: "asset:///images/cam1.png"
                    visible: settings.setCam1Checkbox.checked

                    onClicked: {
                        console.log("Cam1 button is pressed")
                        upbutton.visible = true
                        downbutton.visible = true
                        rightbutton.visible = true
                        leftbutton.visible = true
                        //svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi" //[?admin=&pwd=&resolution=]"
                        //                       sharelabel.visible = false

                        settings.setCamName.objectName = "cam1Name"
                        settings.setIPAddress.objectName = "cam1IP"
                        settings.setextIPAddress.objectName = "cam1extIP"
                        settings.setPort.objectName = "cam1Port"

                        cameraDescription.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")

                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false) {
                            svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        } else {
                            svwebview.url = "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }
                    }
                    scaleX: 0.7
                    scaleY: 0.7
                    pressedImageSource: "asset:///images/cam1pressed.png"
                }

                ImageButton {
                    id: camera2
                    defaultImageSource: "asset:///images/cam2.png"
                    visible: settings.setCam2Checkbox.checked

                    onClicked: {
                        console.log("Cam2 button is pressed")
                        upbutton.visible = true
                        downbutton.visible = true
                        rightbutton.visible = true
                        leftbutton.visible = true
                        //svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi" //[?admin=&pwd=&resolution=]"
                        //                        sharelabel.visible = false

                        settings.setCamName.objectName = "cam2Name"
                        settings.setIPAddress.objectName = "cam2IP"
                        settings.setextIPAddress.objectName = "cam2extIP"
                        settings.setPort.objectName = "cam2Port"

                        cameraDescription.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")

                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false) {
                            svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }
                        else{                        
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }  
                    }
                    scaleX: 0.7
                    scaleY: 0.7
                    pressedImageSource: "asset:///images/cam2pressed.png"
                }
                ImageButton {
                    id: camera3
                    defaultImageSource: "asset:///images/cam3.png"
                    visible: settings.setCam3Checkbox.checked

                    onClicked: {
                        console.log("Cam3 button is pressed")
                        upbutton.visible = true
                        downbutton.visible = true
                        rightbutton.visible = true
                        leftbutton.visible = true
                        //svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi" //[?admin=&pwd=&resolution=]"
  //                      sharelabel.visible = false
                        
                        settings.setCamName.objectName = "cam3Name"
                        settings.setIPAddress.objectName = "cam3IP"
                        settings.setextIPAddress.objectName = "cam3extIP"
                        settings.setPort.objectName = "cam3Port"
                        
                        cameraDescription.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                                                                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"    
                        }
                        else{                        
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }  
                    }
                    scaleX: 0.7
                    scaleY: 0.7
                    pressedImageSource: "asset:///images/cam3pressed.png"
                }
                ImageButton {
                    id: camera4
                    defaultImageSource: "asset:///images/cam4.png"
                    visible: settings.setCam4Checkbox.checked

                    onClicked: {
                        console.log("Cam4 button is pressed")
                        upbutton.visible = true
                        downbutton.visible = true
                        rightbutton.visible = true
                        leftbutton.visible = true
                        //svwebview.url = "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi" //[?admin=&pwd=&resolution=]"
     //                   sharelabel.visible = false
                        
                        settings.setCamName.objectName = "cam4Name"
                        settings.setIPAddress.objectName = "cam4IP"
                        settings.setextIPAddress.objectName = "cam4extIP"
                        settings.setPort.objectName = "cam4Port"
                        
                        cameraDescription.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")                         
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"    
                        }
                        else{                        
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }  
                    }
                    scaleX: 0.7
                    scaleY: 0.7
                    pressedImageSource: "asset:///images/cam4pressed.png"
                }
                ImageButton {
                    id: refresh
                    defaultImageSource: "asset:///images/refresh.PNG"
                    visible: false
                    
                    onClicked: {
                        console.log("Refresh button is pressed")
                        upbutton.visible = true
                        downbutton.visible = true
                        rightbutton.visible = true
                        leftbutton.visible = true
                        controls.visible = true
                        refresh.visible = false
                        capture.visible = true
                        shareLabel.visible = false
                        
                        //This is to update the camera button as per checkbox setting
                        settings.setCam1Checkbox.objectName = "setCam1Checkbox"
                        camera1.visible = _starshipApp.getValueFor(settings.setCam1Checkbox.objectName, "false") == "true" ? true : false
                        //camera1.clicked();
                        
                        settings.setCam2Checkbox.objectName = "setCam2Checkbox"
                        camera2.visible = _starshipApp.getValueFor(settings.setCam2Checkbox.objectName, "false") == "true" ? true : false
                        //camera2.clicked();
                        
                        settings.setCam3Checkbox.objectName = "setCam3Checkbox"
                        camera3.visible = _starshipApp.getValueFor(settings.setCam3Checkbox.objectName, "false") == "true" ? true : false
                        //camera3.clicked();
                        
                        settings.setCam4Checkbox.objectName = "setCam4Checkbox"
                        camera4.visible = _starshipApp.getValueFor(settings.setCam4Checkbox.objectName, "false") == "true" ? true : false
                        //camera4.clicked();
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") +"/videostream.cgi[?admin=&pwd=&resolution=]"   
                        }
                        else{                        
                            svwebview.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") +"/videostream.cgi[?admin=&pwd=&resolution=]"
                        } 
                    }
                    scaleX: 0.7
                    scaleY: 0.7
                }
              Label {
              	id: shareLabel
              	text: qsTr("To share/save the image, please touch and hold the image")
                    visible: false
                    multiline: true
                    textStyle.fontStyle: FontStyle.Italic
                    textStyle.color: Color.Black
                }  

            } //end of container (snapshot)

//--------------------------------------            
//Container for the navigational arrows
//--------------------------------------
            Container {
                id: controls
                background: Color.White
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                WebView {
                    id: webcontroler
                    visible: false
                }
                ImageButton {
                    id: upbutton
                    defaultImageSource: "asset:///images/up.PNG"
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 250.0
                    }
                    scaleX: 0.5
                    scaleY: 0.5

                    onTouch: {
                        if (event.isDown()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=0[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=0[&next_url=]"
                            }
                        
                        }
                        if (event.isUp()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=1[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=1[&next_url=]"
                            }                           
                        }
                    }
                    pressedImageSource: "asset:///images/navigationpressed.png"
                }//End of upbutton

                ImageButton {
                    id: downbutton
                    defaultImageSource: "asset:///images/bottom.PNG"
                    scaleX: 0.5
                    scaleY: 0.5
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 245.0
                        positionY: 250.0
                    }
                    onTouch: {
                        if (event.isDown()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=2[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=2[&next_url=]"
                            }
                        
                        }
                        if (event.isUp()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=3[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=3[&next_url=]"
                            }                        
                        }                    
                    }
                    pressedImageSource: "asset:///images/navigationpressed.png"
                }//end of down  button
                
                ImageButton {
                    id: leftbutton
                    defaultImageSource: "asset:///images/left.PNG"
                    scaleX: 0.5
                    scaleY: 0.5
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 100.0
                        positionY: 120.0
                    }
                    onTouch: {
                        if (event.isDown()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=4[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=4[&next_url=]"
                            }                        
                        }
                        if (event.isUp()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=5[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=5[&next_url=]"
                            }                       
                        }                    
                    }
                    pressedImageSource: "asset:///images/navigationpressed.png"
                
                }//end of left button
                
                ImageButton {
                    id: rightbutton
                    defaultImageSource: "asset:///images/right.PNG"
                    scaleX: 0.5
                    scaleY: 0.5
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 410.0
                        positionY: 120.0
                    }
                 onTouch: {
                        if (event.isDown()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=6[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=6[&next_url=]"
                            }                       
                        }
                        if (event.isUp()) {
                            if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=7[&next_url=]"    
                            }
                            else{
                                webcontroler.url = "http://"+_starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello")+"//decoder_control.cgi?command=7[&next_url=]"
                            }                        
                        }                    
                    }
                    pressedImageSource: "asset:///images/navigationpressed.png"
                }//end of right button                
            }//end of container(controls)        
            }//end of main container

actions: [
    ActionItem {
        title: qsTr("Muti-view") + Retranslate.onLocaleOrLanguageChanged
        ActionBar.placement: ActionBarPlacement.OnBar
        
        onTriggered: {
            // A second Page is created and pushed when this action is triggered.
            navigationPane.push(secondPageDefinition.createObject());
        }
                imageSource: "asset:///images/multiview.png"
            },
    ActionItem {
        title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
        ActionBar.placement: ActionBarPlacement.OnBar
        
        onTriggered: {
            // A second Page is created and pushed when this action is triggered.
            navigationPane.push(settingsPageDefinition.createObject());
        }
                imageSource: "asset:///images/settings.png"
            }
]
        onCreationCompleted: {
            console.log("Buton 2 is pressed");
        }
}//end of page

    attachedObjects: [
        // Definition of the second Page, used to dynamically create the Page above.
        ComponentDefinition {
            id: secondPageDefinition
            source: "Multi view.qml"
        },
        ComponentDefinition {
            id: settingsPageDefinition
            source: "Settings.qml"
        },
        ComponentDefinition {
            id: aboutPageDefinition
            source: "About_Page.qml"
        },
        Settings {
            id: settings
        },
        OrientationHandler {
            onOrientationAboutToChange: {
                if (orientation == UIOrientation.Landscape) {
                    console.log("IPM: Orientation changed to Landscape");
                    singlecamview.actionBarVisibility = ChromeVisibility.Hidden
                    snapshot.visible = false;
                    viewer_controls_l.visible = true
                    controls.visible = false
                }
                if (orientation == UIOrientation.Portrait) {
                    console.log("IPM: Orientation changd to Portrait");
                    singlecamview.actionBarVisibility = ChromeVisibility.Overlay
                    snapshot.visible = true;
                    viewer_controls_l.visible = false
                    controls.visible = true
                }
            }
        }       
    ]
    
    onPopTransitionEnded: {
        // Destroy the popped Page once the back transition has ended.
        page.destroy();
        refresh.clicked();
    }

}//End of Nav Pane
