function populateDelegate (parent, model, index) {
 var button= Qt.createQmlObject ('import QtQuick 2.4; import QtQuick.Controls 1.2; Button { }', parent);
    parent.height = 32;
    button.width = parent.width = 256;
    button.height = parent.height = 32;
    //button.text = "Button index " + index + ", " + model.first + ", " + model.second;
    button.text = "Button index " + index;
    console.log ("Model: " + model + ", index: " + index + ", button: " + button);
}
