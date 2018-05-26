import QtQuick 2.5

Rectangle {
    id: root
    color: "white"

    property int stage
    property real scalew: root.width/100
    property real scaleh: root.height/100

    onStageChanged: {
        if (stage == 1) {
            intro.running=true}

        else if (stage == 2) {
            intro.targets = colorWheel;
            intro.duration = 400
            intro.running = true }

        else if (stage == 4) {
            intro.targets = [ image1, image2, image3, image4, image5, image6, image7];
            intro.to = 0;
            intro.duration = 700;
            intro.running = true }

        else if (stage == 5) {
            welcomeAnimation.running = true
        }
    }

    Image {
        id: colorWheel
        x: plasma.x
        y: plasma.y
        opacity: 0
        sourceSize{
            width: root.scaleh*110
            height: root.scaleh*110
        }
        source: "colorWheel.svg"
        RotationAnimation on rotation {
            id: rotateWheel
            from: 0
            to: 360
            duration: 6000
            loops: Animation.Infinite
            running: true
        }
    }

    Rectangle {
        id: rectangleLeft
        x: 0
        y: 0
        width: (root.width - plasma.width)/2
        height: root.height
        anchors
        {
            left: root.left
        }
        color: "#ffffff"
    }

    Rectangle {
        id: rectangleRight
        x: plasma.x + plasma.width
        y: 0
        width: (root.width - plasma.width)/2
        height: root.height
        anchors
        {
            left: plasma.right
        }
        color: "#ffffff"
    }

    Image {
        id: plasma
        anchors {
            left: rectangleLeft.right
            top: root.top
            bottom: root.bottom
        }

        sourceSize.height: root.height
        source: "plasma.svg"
    }

    Image {
        id: welcome
        fillMode: Image.PreserveAspectFit
        sourceSize.height: root.scaleh*10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: hiderect.top
        source: "welcome.png"
    }

    Rectangle {
        id: hiderect
        width: welcome.width
        height: welcome.height
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: root.scaleh*20
    }

    Image {
        id: image1
        opacity: 0
        anchors {
            bottom: parent.bottom
            bottomMargin: root.scaleh*2
            right: parent.right
            rightMargin: -(root.scalew*4)
        }
        sourceSize {
            width: root.scalew*50
            height: root.scaleh*50
        }
        rotation: -87
        source: "huumph.png"
    }

    Image {
        id: image2
        opacity: 0
        x: -image2.width/5
        anchors {
            bottom: parent.bottom
            bottomMargin: -root.scaleh*3
        }
        sourceSize {
            width: root.scalew*53
            height: root.scaleh*53
        }
        rotation: 68
        source: "kiss.png"
    }

    Image {
        id: image3
        opacity : 0
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -root.scalew*14
            topMargin: -root.scaleh*2
        }
        sourceSize {
            width: root.scalew*40
            height: root.scaleh*40
        }
        rotation: 180
        source: "o.png"
    }

    Image {
        id: image4
        opacity: 0
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: root.scalew*14
            topMargin: -root.scaleh*2
        }
        sourceSize {
            width: root.scalew*40
            height: root.scaleh*40
        }
        rotation: 180
        source: "x.png"
    }

    Image {
        id: image5
        opacity: 0
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -root.scalew*2
            bottomMargin: -root.scaleh
        }
        sourceSize {
            width: root.scalew*50
            height: root.scaleh*50
        }

        source: "lub2.png"
    }

    Image {
        id: image6
        opacity: 0
        x: 0 - image6.width/6
        anchors {
            top: parent.top
            topMargin: -root.scaleh*4
        }

        sourceSize {
            width: root.scalew*40
            height: root.scaleh*40
        }
        rotation: 140
        source: "excited.png"
    }


    Image {
        id: image7
        opacity: 0
        x: root.width - image7.width + image7.width/3
        anchors {
            top: parent.top
            topMargin: -root.scaleh*5
        }
        sourceSize {
            width: root.scalew*50
            height: root.scaleh*50
        }
        rotation: -120
        source: "lub.png"
    }


    PropertyAnimation {
        id: intro
        targets: [image1, image2, image3, image4, image5, image6, image7]
        property: "opacity"
        to: 1
        running: false
        duration: 800
        easing.type: Easing.InOutQuad
    }

    PropertyAnimation {
        id: welcomeAnimation
        target: welcome
        property: "anchors.topMargin"
        to:-welcome.height
        duration: 1100
        running: false
        easing.type: Easing.OutCirc
    }

}
