BGSTextViewWithPlaceholder
==========================

This project creates a  UITextView class that performs as a standard UITextView but enables the inclusion of formatted placeholder text.  Similar to UITextField. 
CocoaPods Install
==========================

Add pod 'BGSTextViewWithPlaceholder' to your Podfile.

Usage Notes (Swift)
==========================
BGSTextViewWithPlaceholder is written in Objective C and a demo project is included in the git repo.  But most of the apps I use it in are now written in Swift so hope this helps anyone using Swift.
I use frameworks in my pod file, so implementing BGSTextViewWithPlaceholder simply requires an import in any class that implements BGSTextViewWithPlaceholder.

    import BGSTextViewWithPlaceholder
    
     @IBOutlet weak var tvDescription: BGSTextViewWithPlaceholder!

    func configTVDesc()
    {
        tvDescription.text = ""
        // Number of lines to use
        tvDescription.intLines = 2
        // Center in textview
        tvDescription.position = 1
        let attribStr = NSMutableAttributedString.init(string: "a brief description of the property \n something that you would be happy to show to clients")
        tvDescription.strPlaceholder = attribStr
     }
