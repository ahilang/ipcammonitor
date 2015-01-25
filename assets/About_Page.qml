import bb.cascades 1.2
//NavigationPane {
    Page {
        titleBar: TitleBar {
            // Localized text with the dynamic translation and locale updates support
            title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
        }
Container {
        id: containerID
        ScrollView {
            TextArea {
                text: qsTr("Application Name: IP Cam Monitor\r\nVersion: 1.0.0.5\r\nSupport: mapledigsol@gmail.com\r\nVideo: http://youtu.be/DQlgLh3QTxI\r\n\r\nFEATURES                \r\n- Supports up to 4 cameras  (Note: Only Tenvis models are supported)          \r\n- User friendly GUI to control and configure the cameras\r\n- Supports image capturing, sharing, and saving\r\n- Supports multi-camera layout (stack layout)\r\n- Supports landscape mode view\r\n                \r\nINSTRUCTIONS\r\n\r\nNote: Please follow the instructions provided by the camera vendor to setup the camera in home or desired Wi-Fi network before trying the mobile app - IP Cam Monitor.\r\n \r\n1. Launch 'IP Cam Monitor' app and navigate to Settings screen\r\n2. Select the check box for 'Configure Camera 1'\r\n3. Select 'Configure Camera 1' button\r\n4. Enter the following information under 'Camera 1' section: \r\n-Name (Optional)\r\n-IP (IP address to access the camera over LAN, Eg. 192.168.0.x)\r\n-Ext IP* (IP address to access the camera from external network, *needed only if accessing from external network, Eg. 99.248.62.xx)\r\n-Port (Port number configured)\r\n5. Select the check box for the network connection type (LAN - if connected to the same network as the camera, External - if connected via mobile network or external WiFi network)\r\n6. Navigate back to main screen and wait ~30 seconds\r\n(User login prompt will be shown if you have a user name/password set for the camera, Login credentials will be saved in BlackBerry file system, IP Cam Monitor app doesn't save the user name/password locally)\r\n\r\nNOTE: If you see error message after Step 6, try the 'Test Connection' feature under Settings.")
                textFit.maxFontSizeValue: 3.0
                textFit.minFontSizeValue: 2.0
                editable: false
            }
        }
    }
}

