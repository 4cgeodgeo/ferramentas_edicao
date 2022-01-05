from PyQt5.QtWidgets import QComboBox

class ProductTypeSelector(QComboBox):

    options = {
        'Topográfica': 0,
        'Ortoimagem': 1
    }

    def __init__(self, iface, toolBar):
        super().__init__(iface.mainWindow())
        self.iface = iface
        self.toolBar = toolBar

    def setupUi(self):
        self.insertItems(-1, [x for x in self.options.keys()])
        self.toolBar.addWidget(self)