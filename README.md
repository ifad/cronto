# CRONTO Image generator

This is a super simple command-line wrapper for Onespan's [Image Generator SDK][Onespan-IMG-SDK]
to generate cronto images out of the getSecureChallenge SOAP API call output, for provisioning
DIGIPASS smart tokens.

Use it by passing the secure challenge hex string as the first parameter, and get a base64-encoded
PNG image as a result.

Use with care!

[Onespan-IMG-SDK]: https://community.onespan.com/documentation/mobile-security-suite/guides/integration-guides/developer/generate-crontosign-and-cronto-dynamic-images-image-generator-sdk
