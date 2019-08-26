//
//  NFCViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/26.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit
import CoreNFC

class NFCViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sesstion = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("reader nfc with error:\(error)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        messages.forEach {
            message in
            message.records.forEach {
                data in
                print("reader nfc\(data.payload)")
                print("reader nfc\(data.identifier)")
                print("reader nfc\(data.type)")
                print("reader nfc\(data.typeNameFormat)")
            }
        }
        print("reader nfc:\(messages)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
