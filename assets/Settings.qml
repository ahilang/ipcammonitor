import bb.cascades 1.2
    
Page {
    id: settingsPage2
    property alias setCamName : setCamName
    property alias setIPAddress : setIPAddress
    property alias setextIPAddress : setextIPAddress
    property alias setPort : setPort
    property alias setCam1Checkbox : setCam1Checkbox
    property alias setCam2Checkbox : setCam2Checkbox
    property alias setCam3Checkbox : setCam3Checkbox
    property alias setCam4Checkbox : setCam4Checkbox
    property alias externalCheckBox : externalCheckBox
    property alias lanCheckBox : lanCheckBox
    
    actions: [
        ActionItem {
            title: qsTr("About")
            //imageSource: "asset:///images/invoke.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                // About page is created and pushed when this action is triggered.
                navigationPane.push(aboutPageDefinition.createObject());
            }
            imageSource: "asset:///images/about.png"
        }
    ]

    titleBar: TitleBar {
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
    }

    ScrollView {

	Container {
            minWidth: 10.0
            layout: AbsoluteLayout {
            }
            CheckBox {
                id: setCam1Checkbox
                objectName: "setCam1Checkbox"
                checked: _starshipApp.getValueFor(objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 50.0
                    positionY: 50.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(setCam1Checkbox.objectName, setCam1Checkbox.checked)
                    if (checked) {
                        setCam1Button.enabled = true
                        setCam2Checkbox.enabled = true
                        setCamName.visible = true
                        setIPAddress.visible = true
                        setextIPAddress.visible = true
                        setPort.visible = true
                        headerDisplay.visible = true
                    } else {
                        setCam1Button.enabled = false
                        setCam2Checkbox.enabled = false
                        setCam2Checkbox.checked = false
                        setCamName.visible = false
                        setIPAddress.visible = false
                        setextIPAddress.visible = false
                        setPort.visible = false
                        headerDisplay.visible = false
                        setSaveButton.visible = false

                        camera.ipview1Container.enabled = false
                    }
                    //                    if(!setCam1Checkbox.checked && !setCam2Checkbox.checked && !setCam3Checkbox.checked && !setCam4Checkbox.checked){
                    //                     headerDisplay.visible = false
                    //                    }
                }

            }
            Button {
                id: setCam1Button

                text: "Configure Camera 1"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 35.0
                    positionX: 200.0

                }
                enabled: false
                onClicked: {

                    headerDisplay.title = "Camera 1"
//                    setSaveButton.enabled = true
//                    setSaveButton.visible = true
                    setCamName.editable = true
                    setIPAddress.editable = true
                    setextIPAddress.editable = true
                    setPort.editable = true
                    setCamName.objectName = "cam1Name"
                    setIPAddress.objectName = "cam1IP"
                    setextIPAddress.objectName = "cam1extIP"
                    setPort.objectName = "cam1Port"
                }

            }

            CheckBox {
                id: setCam2Checkbox
                objectName: "setCam2Checkbox"
                enabled: false
                checked: _starshipApp.getValueFor(objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 50.0
                    positionY: 150.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(setCam2Checkbox.objectName, setCam2Checkbox.checked)
                    if (checked) {
                        setCam2Button.enabled = true
                        setCam3Checkbox.enabled = true
                    } else {
                        setCam2Button.enabled = false
                        setCam3Checkbox.enabled = false
                        setCam3Checkbox.checked = false
                    }
                }

            }
            Button {
                id: setCam2Button
                enabled: false
                text: "Configure Camera 2"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 135.0
                    positionX: 200.0
                }
                onClicked: {
                    headerDisplay.title = "Camera 2"
//                    setSaveButton.enabled = true
//                    setSaveButton.visible = true
                    setCamName.editable = true
                    setIPAddress.editable = true
                    setextIPAddress.editable = true
                    setPort.editable = true
                    setCamName.objectName = "cam2Name"
                    setIPAddress.objectName = "cam2IP"
                    setextIPAddress.objectName = "cam2extIP"
                    setPort.objectName = "cam2Port"
                }

            }
            
            CheckBox {
                id: setCam3Checkbox
                objectName: "setCam3Checkbox"
                enabled: false
                checked: _starshipApp.getValueFor(objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 50.0
                    positionY: 250.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(setCam3Checkbox.objectName, setCam3Checkbox.checked)
                    if (checked) {
                        setCam3Button.enabled = true
                        setCam4Checkbox.enabled = true
                    } else {
                        setCam3Button.enabled = false
                        setCam4Checkbox.enabled = false
                        setCam4Checkbox.checked = false
                    }
                }

            }
            Button {
                id: setCam3Button
                enabled: false
                text: "Configure Camera 3"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 235.0
                    positionX: 200.0
                }
                onClicked: {
                    headerDisplay.title = "Camera 3"
//                    setSaveButton.enabled = true
//                    setSaveButton.visible = true
                    setCamName.editable = true
                    setIPAddress.editable = true
                    setextIPAddress.editable = true
                    setPort.editable = true
                    setCamName.objectName = "cam3Name"
                    setIPAddress.objectName = "cam3IP"
                    setextIPAddress.objectName = "cam3extIP"
                    setPort.objectName = "cam3Port"
                }

            }            
            
            CheckBox {
                id: setCam4Checkbox
                objectName: "setCam4Checkbox"
                enabled: false
                checked: _starshipApp.getValueFor(objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 50.0
                    positionY: 350.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(setCam4Checkbox.objectName, setCam4Checkbox.checked)
                    if (checked) {
                        setCam4Button.enabled = true
                    } else {
                        setCam4Button.enabled = false
                    }
                }

            }
            Button {
                id: setCam4Button
                enabled: false
                text: "Configure Camera 4"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 335.0
                    positionX: 200.0
                }
                onClicked: {
                    headerDisplay.title = "Camera 4"
//                    setSaveButton.enabled = true
//                    setSaveButton.visible = true
                    setCamName.editable = true
                    setIPAddress.editable = true
                    setextIPAddress.editable = true
                    setPort.editable = true
                    setCamName.objectName = "cam4Name"
                    setIPAddress.objectName = "cam4IP"
                    setextIPAddress.objectName = "cam4extIP"
                    setPort.objectName = "cam4Port"
                }
            }            
            
            //--------------------------
            //LAN & External Checkboxes
            //--------------------------
/*            Label {
                id: netowork_label
                text: "Network"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 480.0
                }
            }
*/            Label {
                id: external_label
                text: "External"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 420.0
                    positionY: 433.0

                }
                textStyle.fontSizeValue: 0.0
                textStyle.lineHeight: 0.0

            }
            CheckBox {
                id: externalCheckBox
                objectName: "externalCheckBox"
                checked: _starshipApp.getValueFor(externalCheckBox.objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 360.0
                    positionY: 433.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(externalCheckBox.objectName, externalCheckBox.checked)
                    if (checked) {
                        lanCheckBox.checked = false
                    } else {
                        lanCheckBox.checked = true
                    }
                }
            }
            Label {
                id: lan_label
                text: "LAN"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 260.0
                    positionY: 433.0

                }

            }
            CheckBox {
                id: lanCheckBox
                objectName: "lanCheckBox"
                checked: _starshipApp.getValueFor(lanCheckBox.objectName, "false") == "true" ? true : false
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 200.0
                    positionY: 433.0
                }
                onCheckedChanged: {
                    _starshipApp.saveValueFor(lanCheckBox.objectName, lanCheckBox.checked)
                    if (checked) {
                        externalCheckBox.checked = false
                    } else {
                        externalCheckBox.checked = true
                    }
                }
            }
            //----------------------------------------------------
            //Display section starts here
            //----------------------------------------------------

            Header {
                id: headerDisplay
                title: "Camera 1"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 0.0
                    positionY: 500.0
                }
                horizontalAlignment: HorizontalAlignment.Center
            }
            Label {
                text: "Name:"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 600.0

                }

            }
            TextArea {
                id: setCamName
                objectName: "cam1Name"
                editable: false
                text: _starshipApp.getValueFor(setCamName.objectName, setCamName.hintText)
                hintText: "Camera name or description"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 580.0
                    positionX: 120.0

                }

                textStyle.color: Color.create("#ff00bfff")
                inputMode: TextAreaInputMode.Chat
                maximumLength: 35
                onTextChanging: {
                    _starshipApp.saveValueFor(setCamName.objectName, setCamName.text);
                }

                preferredWidth: 600.0

            }
            Label {
                text: "IP:"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 700.0

                }

            }
            TextArea {
                id: setIPAddress
                objectName: "cam1IP"
                editable: false
                text: _starshipApp.getValueFor(setIPAddress.objectName, setIPAddress.hintText)
                hintText: "Camera IP address"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 680.0
                    positionX: 120.0

                }
                textStyle.color: Color.create("#ff00bfff")
                maximumLength: 35
                onTextChanging: {
                    _starshipApp.saveValueFor(setIPAddress.objectName, setIPAddress.text);
                }
                preferredWidth: 600.0

            }
            Label {
                text: "Ext IP:"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 800.0

                }
            }
            TextArea {
                id: setextIPAddress
                objectName: "cam1extIP"
                editable: false
                text: _starshipApp.getValueFor(setextIPAddress.objectName, setextIPAddress.hintText)
                hintText: "Required if 'External' is checked"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 780.0
                    positionX: 120.0

                }
                textStyle.color: Color.create("#ff00bfff")
                maximumLength: 35
                onTextChanging: {
                    _starshipApp.saveValueFor(setextIPAddress.objectName, setextIPAddress.text);
                }
                preferredWidth: 600.0
            }
            Label {
                text: "Port:"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 900.0

                }

            }
            TextArea {
                id: setPort
                objectName: "cam1Port"
                editable: false
                text: _starshipApp.getValueFor(setPort.objectName, setPort.hintText)
                hintText: "Camera port number"
                layoutProperties: AbsoluteLayoutProperties {
                    positionY: 880.0
                    positionX: 120.0
                }
                textStyle.color: Color.create("#ff00bfff")
                maximumLength: 25
                onTextChanging: {
                    _starshipApp.saveValueFor(setPort.objectName, setPort.text);
                }
                preferredWidth: 600.0

            }

            //This button can be removed!
            Button {
                id: setSaveButton
                text: "Save"
                enabled: false
                visible: false
                onClicked: {
                    _starshipApp.saveValueFor(setCamName.objectName, setCamName.text);
                    _starshipApp.saveValueFor(setIPAddress.objectName, setIPAddress.text);
                    _starshipApp.saveValueFor(setextIPAddress.objectName, setextIPAddress.text);
                    _starshipApp.saveValueFor(setPort.objectName, setPort.text);
                    setSaveButton.enabled = false
                    setCamName.editable = false
                    setIPAddress.editable = false
                    setextIPAddress.editable = false
                    setPort.editable = false
                    setSaveButton.visible = false

                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 120.0
                    positionY: 970.0

                }
            }
            
            Header {
                id: headerDisplay2
                title: "Test Connection"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 0.0
                    positionY: 1000.0
                }
                horizontalAlignment: HorizontalAlignment.Center
            }
            

            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 0.0
                    positionY: 1000.0
                }
                layout: AbsoluteLayout {
    
                }

                TextArea {
                    id: info
                    editable: false
                    visible: testconnection.checked
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 0.0
                        positionY: 140.0
                    }
                    text: "Try this only if you have problem viewing the camera in IP Cam Monitor app (Noe: This test is only for Camera 1). Select the 'Test Connection' button above. This will launch the BlackBerry Browser and connect from there. If connected, 'Welcome to Use IP Camera' page from Tenvis will be shown. If not, please make sure the camera is configured properly and/or your device is connected to the same WiFi network as the camera."

                }
                ToggleButton {
                    id: testconnection
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 10.0
                        positionY: 70.0
                    }
                }
                
                Button {
                    id: cam1TC               
                    text: "Test Connection"
                    enabled: setCam1Checkbox.checked
                    visible: testconnection.checked
                    objectName: "cam1IP"
                    layoutProperties: AbsoluteLayoutProperties {
                        positionY: 70.0
                        positionX: 270.0
                    
                    }
                    attachedObjects: [
                        Invocation {
                            id: invoke1
                            query {
                                //mimeType: "text/txt"
                                uri: "http://"+_starshipApp.getValueFor(setIPAddress.objectName, setIPAddress.hintText)+":"+_starshipApp.getValueFor(setPort.objectName, setPort.hintText)
                                invokeActionId: "bb.action.OPEN"
                                invokeTargetId: "sys.browser"
                                //data:"www.google.com"
                            }
                        }
                    ]
                    onClicked: {                   
                        invoke1.trigger("bb.action.OPEN")
                    }
                    preferredWidth: 10.0
                    imageSource: "asset:///images/app_icon.png"
                
                }
            
            }
            
            
        } //end of container
	
    } //end of ScrollView
 
} //end of page
