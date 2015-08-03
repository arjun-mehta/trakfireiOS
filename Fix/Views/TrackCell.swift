//
//  TrackCell.swift
//  trakfire
//
//  Created by Arjun Mehta on 7/17/15.
//  Copyright (c) 2015 Arjun Mehta. All rights reserved.
//

import UIKit
//import StreamingKit

class TrackCell: UITableViewCell, NSURLSessionDelegate {
    
    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet weak var songTitle: UILabel!
    @IBAction func playButton(sender: UIButton) {
        var urlToCall = "http://puu.sh/jf3Wo/8716f43b8c.mp3"
        
        var audioPlayer: STKAudioPlayer = STKAudioPlayer()
        audioPlayer.play(urlToCall)
        
    }
    
    var session:NSURLSession!
    
    
    func URLSession(session: NSURLSession!, downloadTask: NSURLSessionDownloadTask!, didFinishDownloadingToURL location: NSURL!) {
        println("done")
        println(location)
        
//        let filemanager = NSFileManager.defaultManager()
//        var error = NSError()
//        let temporary = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//        
//        let docsDir = temporary[0]
//        
//        var appDir = docsDir.stringByAppendingPathComponent("/Reader/")
//        
//        if(filemanager.fileExistsAtPath(appDir) == false) {
//            filemanager.createDirectoryAtPath(appDir, withIntermediateDirectories: false, attributes: nil, error: nil)
//        }
//        
//        appDir += "/\(downloadTask.response)"
//        
//        if (filemanager.fileExistsAtPath(appDir)){
//            
//            println(filemanager.removeItemAtPath(appDir, error: nil) ? "deleted" : "not deleted")
//        }
//        
//        let filecopied = filemanager.moveItemAtPath(location.path!, toPath: appDir, error: nil)
//        println(filecopied ? "yes":"no")
        
        var error:NSError? = nil
        var fileHandle = NSFileHandle(forReadingFromURL: location, error: &error)
        println(fileHandle)
        var fileData = fileHandle?.readDataToEndOfFile()
        
//        var dataString = NSString(data: fileData!, encoding: NSUTF8StringEncoding)
//        //let url = NSURL(string: dataString, relativeToURL: )
//        
//        //let wavData = NSData(data: url)
//        
//        let player = AVAudioPlayer(data: wavData, error: &error)
//        player.play()
//        
    }
    
    func URLSession(session: NSURLSession!, downloadTask: NSURLSessionDownloadTask!, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
    }

    func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?) {
        println(error)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
        WebView.delegate = self
        WebView.allowsInlineMediaPlayback = true

        let localfilePath = NSBundle.mainBundle().URLForResource("index", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        WebView.loadRequest(myRequest);
        
        var fileName: String?
        var finalPath: NSURL?
//        var urlToCall = "https://ec-preview-media.sndcdn.com/preview/0/90/Y864UtbdPl4E.128.mp3?f10880d39085a94a0418a7e162b03d52e21adf826af17a391e1b7410332f9ef68183cc0b08d41e4ce796554cc5335572ad34a14e4b7a8d51f24825b5e4385be449882cec87f7bb6408b518478a3bdaafccbb"
        
        
        
        //var urlToCall = "http://podcastdownload.npr.org/anon.npr-podcasts/podcast/344098539/424194045/npr_424194045.mp3?orgId=1&d=2873&p=344098539&story=424194045&t=podcast&e=424194045&ft=pod&f=344098539&_kip_ipx=34243387-1437778383"
        
        
//        let destination = Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
//        println("dest \(destination)")
//        Alamofire.download(.GET, urlToCall, destination).progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
//            println(totalBytesRead)
//                
//            }
        
        
//        
//        Alamofire.download(.GET, urlToCall, { (temporaryURL, response) in
//            
//            if let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as? NSURL {
//                
//                fileName = response.suggestedFilename!
//                finalPath = directoryURL.URLByAppendingPathComponent(fileName!)
//                return finalPath!
//            }
//            
//            return temporaryURL
//        })
//            .response { (request, response, data, error) in
//                
//                if error != nil {
//    
//                    println("REQUEST: \(request)")
//                    println("RESPONSE: \(response)")
//                } 
//                
//                if finalPath != nil {
//                    println(finalPath)
//                    //doSomethingWithTheFile(finalPath!, fileName: fileName!)
//                }
//        }
        
        
//        var sessionConfiguration:NSURLSessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.company")
//        sessionConfiguration.HTTPMaximumConnectionsPerHost = 5
//        
//        self.session = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
//        
//        var downloadTask:NSURLSessionDownloadTask = self.session.downloadTaskWithURL(NSURL(string: urlToCall)!)
//        downloadTask.resume()
//        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TrackCell: UIWebViewDelegate {
        
        func webView(WebView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
            return true
            
        }
    
        func webViewDidStartLoad(WebView: UIWebView) {
        
        }
    
        func webViewDidFinishLoad(WebView: UIWebView) {
        
        }
    
        func webView(WebView: UIWebView, didFailLoadWithError error: NSError) {
        
        }
    
}