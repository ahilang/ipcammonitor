import bb.cascades 1.2

Page {
    id: camera
    property alias ipview1: ipview1
    property alias ipview2: ipview2
    property alias ipview1Container: ipview1Container    
    
    actions: [
        /*               InvokeActionItem {
         ActionBar.placement: ActionBarPlacement.OnBar
         query {
         invokeActionId: "bb.action.DIAL"
         uri: "tel:123"
         //data: 4166487297
         
         }
         },
         InvokeActionItem {
         ActionBar.placement: ActionBarPlacement.OnBar
         query {
         invokeActionId: "bb.action.OPEN"
         uri: "settings://nfc"              
         }
         },
                 */              
        InvokeActionItem {
            ActionBar.placement: ActionBarPlacement.OnBar
            query {
                mimeType: "application/vnd.rim.miracast.showon"
                invokeActionId: "bb.action.VIEW"
                //  invokeTargetId: "sys.settings.card"
            }
        },
                 
        ActionItem {
            title: qsTr("Invoke (best-fit)")
            //imageSource: "asset:///images/invoke.png"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
                                 //_app.invoke()
            }
        },
        ActionItem {
            title: qsTr("Settings")
            //imageSource: "asset:///images/menuinvoke.png"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered:{
                mainLoader.source = "Settings.qml"  
            }
        }                
        ]
 
 Container {							
        background: Color.DarkGray
        layout: StackLayout {

        }
//Container 1
        Container {						
            visible: settings.setCam1Checkbox.checked
            id: ipview1Container
            layout: DockLayout {

            }

            background: Color.DarkGray
            ScrollView {
                WebView {
                    id: ipview1  
                    settings.zoomToFitEnabled: true
                    settings.background: Color.Black
                    settings.activeTextEnabled: true
                    
                    onCreationCompleted: {
                        settings.setCamName.objectName = "cam1Name"
                        settings.setIPAddress.objectName = "cam1IP"
                        settings.setextIPAddress.objectName = "cam1extIP"
                        settings.setPort.objectName = "cam1Port"
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                        ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"    
                        }
                        else{                        
                        ipview1.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"
                        //Below URL flickers the video
                        //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }                   
                    }
                    
                    onLoadingChanged: {                       
                        cam1actin.running = false
                        cam1actin.enabled = false
                    }
                
                }
            }
            
            Label {
                id: camera1Description
                opacity: 0.5
                textStyle.color: Color.create("#ff00bfff")
                horizontalAlignment: HorizontalAlignment.Left
                translationX: 70.0
                translationY: 10.0

                onCreationCompleted: {
                    settings.setCamName.objectName = "cam1Name"
                    camera1Description.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                }


            }
            ActivityIndicator {
                id: cam1actin
                enabled: false

                scaleX: 2.0
                scaleY: 2.0
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                running: true

            }

        } // end of 1st inner container
//Container 2        
        Container {
            visible: settings.setCam2Checkbox.checked
            id: ipview2Container
            layout: DockLayout {
            
            }

            background: Color.DarkGray
            ScrollView {
                WebView {
                    id: ipview2  
                    settings.zoomToFitEnabled: true
                    settings.background: Color.Black
                    settings.activeTextEnabled: true

                    onCreationCompleted: {
                        settings.setCamName.objectName = "cam2Name"
                        settings.setIPAddress.objectName = "cam2IP"
                        settings.setextIPAddress.objectName = "cam2extIP"
                        settings.setPort.objectName = "cam2Port"
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            ipview2.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"    
                        }
                        else{                        
                            ipview2.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }                   
                    }
                    
                    onLoadingChanged: {
                        cam2actin.running = false
                        cam2actin.enabled = false
                    }
                
                }
            }           
            Label {
                id: camera2Description
                opacity: 0.5
                textStyle.color: Color.create("#ff00bfff")
                horizontalAlignment: HorizontalAlignment.Left
                translationX: 70.0
                translationY: 10.0
                
                onCreationCompleted: {
                    settings.setCamName.objectName = "cam2Name"
                    camera2Description.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                }
            
            }
            ActivityIndicator {
                id: cam2actin
                enabled: false
                
                scaleX: 2.0
                scaleY: 2.0
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                running: true
            
            }
        } //end of 2nd inner container
//Container 3        
		Container {
            visible: settings.setCam3Checkbox.checked
            id: ipview3Container
            layout: DockLayout {
            
            }

            background: Color.DarkGray
            ScrollView {
                WebView {
                    id: ipview3  
                    settings.zoomToFitEnabled: true
                    settings.background: Color.Black
                    settings.activeTextEnabled: true

                    onCreationCompleted: {
                        settings.setCamName.objectName = "cam3Name"
                        settings.setIPAddress.objectName = "cam3IP"
                        settings.setextIPAddress.objectName = "cam3extIP"
                        settings.setPort.objectName = "cam3Port"
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            ipview3.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"    
                        }
                        else{                        
                            ipview3.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }                   
                    }
                    
                    onLoadingChanged: {
                        cam3actin.running = false
                        cam3actin.enabled = false
                    }
                
                }
            }
          
            Label {
                id: camera3Description
                opacity: 0.5
                textStyle.color: Color.create("#ff00bfff")
                horizontalAlignment: HorizontalAlignment.Left
                translationX: 70.0
                translationY: 10.0
                
                onCreationCompleted: {
                    settings.setCamName.objectName = "cam3Name"
                    camera3Description.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                }
            
            }
            ActivityIndicator {
                id: cam3actin
                enabled: false
                
                scaleX: 2.0
                scaleY: 2.0
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                running: true
            
            }
        } // end of 3rd inner container
//Container 4        
		Container {
            visible: settings.setCam4Checkbox.checked
            id: ipview4Container
            layout: DockLayout {
            
            }

            background: Color.DarkGray
            ScrollView {
                WebView {
                    id: ipview4  
                    settings.zoomToFitEnabled: true
                    settings.background: Color.Black
                    settings.activeTextEnabled: true

                    onCreationCompleted: {
                        settings.setCamName.objectName = "cam4Name"
                        settings.setIPAddress.objectName = "cam4IP"
                        settings.setextIPAddress.objectName = "cam4extIP"
                        settings.setPort.objectName = "cam4Port"
                        
                        if (_starshipApp.getValueFor(settings.lanCheckBox.objectName, "false") == "true" ? true : false){
                            ipview4.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"    
                        }
                        else{                        
                            ipview4.url= "http://" + _starshipApp.getValueFor(settings.setextIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/video/liveipd.asp"
                            //Below URL flickers the video
                            //ipview1.url= "http://" + _starshipApp.getValueFor(settings.setIPAddress.objectName, "Hi") + ":" + _starshipApp.getValueFor(settings.setPort.objectName, "Hello") + "/videostream.cgi[?admin=&pwd=&resolution=]"
                        }                   
                    }
                    
                    onLoadingChanged: {
                        cam4actin.running = false
                        cam4actin.enabled = false
                    }
                
                }
            }
         
            Label {
                id: camera4Description
                opacity: 0.5
                textStyle.color: Color.create("#ff00bfff")
                horizontalAlignment: HorizontalAlignment.Left
                translationX: 70.0
                translationY: 10.0
                
                onCreationCompleted: {
                    settings.setCamName.objectName = "cam4Name"
                    camera4Description.text = _starshipApp.getValueFor(settings.setCamName.objectName, "Hi")
                }
            
            }
            ActivityIndicator {
                id: cam4actin
                enabled: false
                
                scaleX: 2.0
                scaleY: 2.0
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                running: true
            
            }
        } // end of 4th inner container
    } //end of container
    attachedObjects: [
        Settings {
            id: settings
        }
    ]
    resizeBehavior: PageResizeBehavior.Resize
    actionBarVisibility: ChromeVisibility.Hidden
}//end of page