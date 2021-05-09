import QtQuick 2.0;
import "test.js" as JS;

Rectangle {
    width: 100
    height: 62

    Component.onCompleted: {

        JS.getData("http://ftwgroup.space/wpapi/api/core/get_category_posts/?slug=newspaper")
        JS.internalQmlObject.someSignal.connect(someComponent.someSlot);
        JS.doSomething();

    }
}

