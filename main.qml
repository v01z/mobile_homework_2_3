import QtQuick 2.15
import QtQuick.Window 2.15

Window
{
    width: 330
    height: 330

    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    visible: true
    title: qsTr("Homework_2_part_3")

    function get_random_color()
    {
        return '#' + (0x1000000 + Math.random() * 0xFFFFFF).toString(16).substr(1,6)
    }

    RotationAnimation
    {
        id: rotate_rect
        target: rect
        duration: 1000
        from: 0
        to: 360
    }

    Rectangle
    {
        id: rect
        width: parent.width/1.5
        height: parent.height/1.5
        anchors.centerIn: parent
        color: "green"

        MouseArea
        {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons

            onClicked:
            {
                if(mouse.button == Qt.RightButton)
                {
                    rotate_rect.start()
                }
                else
                    parent.color = get_random_color()
            }

            onDoubleClicked:
            {
                if(mouse.button != Qt.RightButton)
                    parent.radius = parent.height / 2
                else
                    parent.radius = 0;
            }
        }
    }
}
