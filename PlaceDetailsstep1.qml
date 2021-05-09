import QtQuick 2.0
import "test.js" as JS
Rectangle {
    width: 100
    height: 62

    Component.onCompleted: {
        JS.internalQmlObject.someSignal.connect(someComponent.someSlot);
        JS.doSomethingstep1();
    }
}

