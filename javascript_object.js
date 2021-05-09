var internalQmlObject = Qt.createQmlObject('import QtQuick 2.0; QtObject { signal someSignal(int value) }', Qt.application, 'InternalQmlObject');

function doSomething() {
    internalQmlObject.someSignal(42);
}
