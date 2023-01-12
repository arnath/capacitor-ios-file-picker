import Foundation
import Capacitor
import UIKit
import UniformTypeIdentifiers

@objc public class FilePicker: NSObject, UIDocumentPickerDelegate {
  private var call: CAPPluginCall
  private var bridge: CAPBridgeProtocol?
  
  init(_ call: CAPPluginCall, _ bridge: CAPBridgeProtocol?) {
    self.call = call
    self.bridge = bridge
    super.init()
  }
  
  public func chooseDirectory() {
    DispatchQueue.main.async {
      let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.folder])
      documentPicker.delegate = self
      self.bridge?.viewController?.present(documentPicker, animated: true, completion: nil)
    }
  }
  
  public func accessDirectory() {
    guard let url = getUrlFromBookmark() else {
      // Call has already been rejected.
      return
    }
    
    guard url.startAccessingSecurityScopedResource() else {
      self.call.reject("Failed to access external resource.")
      return
    }
    
    self.call.resolve(["url": url.absoluteString])
  }
  
  public func releaseDirectory() {
    guard let url = getUrlFromBookmark() else {
      // Call has already been rejected.
      return
    }
    
    url.stopAccessingSecurityScopedResource()
    
    self.call.resolve()
  }
  
  private func getUrlFromBookmark() -> URL? {
    guard let urlBookmark = self.call.getString("urlBookmark") else {
      self.call.reject("Expected string parameter urlBookmark was missing.")
      return nil
    }
    
    guard let bookmarkData = Data(base64Encoded: urlBookmark) else {
      self.call.reject("Provided bookmark data was invalid.")
      return nil
    }
    
    var isStale = false;
    guard let url = try? URL(resolvingBookmarkData: bookmarkData, bookmarkDataIsStale: &isStale), !isStale else {
      self.call.reject("Provided bookmark data is stale or invalid.")
      return nil
    }
    
    return url
  }
  
  @objc(documentPicker:didPickDocumentAtURL:)
  public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
    do {
      let bookmark = try url.bookmarkData()
      self.call.resolve(["urlBookmark": bookmark.base64EncodedString()])
    } catch {
      self.call.reject("Failed to retrieve bookmark for external directory.")
    }
  }
}
