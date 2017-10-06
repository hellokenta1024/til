## In App PurchaseでInvalidになる時のチェックリスト

- Have you enabled In-App Purchases for your App ID?
- Have you checked Cleared for Sale for your product?
- Have you submitted (and optionally rejected) your application binary?
- Does your project’s .plist Bundle ID match your App ID?
- Have you generated and installed a new provisioning profile for the new App ID?
- Have you configured your project to code sign using this new provisioning profile?
- Are you building for iPhone OS 3.0 or above?
- Are you using the full product ID when when making an SKProductRequest?
- Have you waited several hours since adding your product to iTunes Connect?
- Are your bank details active on iTunes Connect? (via Mark)
- Have you tried deleting the app from your device and reinstalling?
- Is your device jailbroken? If so, you need to revert the jailbreak for IAP to work. (via oh my god, Roman, and xfze)
