import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(FilePickerPlugin)
public class FilePickerPlugin: CAPPlugin {
  @objc func chooseDirectory(_ call: CAPPluginCall) {
    let filePicker = FilePicker(call, self.bridge)
    filePicker.chooseDirectory()
  }
  
  @objc func accessDirectory(_ call: CAPPluginCall) {
    let filePicker = FilePicker(call, self.bridge)
    filePicker.accessDirectory()
  }
  
  @objc func releaseDirectory(_ call: CAPPluginCall) {
    let filePicker = FilePicker(call, self.bridge)
    filePicker.releaseDirectory()
  }
}
