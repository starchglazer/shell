import QtQuick

Item {
  id: root

  property real value: 0

  property int size: 32
  property int lineWidth: 2
  property real gapAngle: Math.PI / 10

  property color primaryColor: "#ffffff"
  property color secondaryColor: "#40ffffff"

  property int animationDuration: 1000
  property var easingType: Easing.OutCubic

  width: size
  height: size

  signal animationFinished();

  onValueChanged: {
    canvas.degree = value * 360;
  }

  Canvas {
    id: canvas

    property real degree: 0

    antialiasing: true
    anchors.fill: parent

    onDegreeChanged: {
      requestPaint();
    }

    onPaint: {
      const context = getContext("2d");

      const epsilon = 0.01;

      const x = root.width / 2, y = root.height / 2;
      const radius = root.size / 2 - root.lineWidth;
      const startAngle = (Math.PI / 180) * 270;
      const fullAngle = (Math.PI / 180) * (270 + 360);

      const progressAngle = (Math.PI / 180) * (270 + degree);
      const endAngle = progressAngle + (value > 0 ? 0 : epsilon);

      context.reset();

      context.lineCap = "round";
      context.lineWidth = root.lineWidth;

      context.beginPath();
      context.arc(x, y, radius, progressAngle + gapAngle, fullAngle - gapAngle);
      context.strokeStyle = root.secondaryColor;
      context.stroke();

      context.beginPath();
      context.arc(x, y, radius, startAngle, endAngle);
      context.strokeStyle = root.primaryColor;
      context.stroke();
    }

    Behavior on degree {
      NumberAnimation {
        duration: root.animationDuration
        easing.type: root.easingType
      }
    }
  }
}
