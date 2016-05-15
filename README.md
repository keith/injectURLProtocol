# injectURLProtocol

This is a simple [cycript][cycript] script for injecting a custom
[`NSURLProtocol`][protocol] that logs every HTTP request.

## Installation

Install [cycript][cycript]. If you'd like to use [homebrew][brew]
instead you can use [my tap][tap] with:

```sh
$ brew install keith/formulae/cycript
```

Then copy `injectURLProtocol.cy` to somewhere you can reference it.

## Usage

Run the script in the process in question:

```sh
$ cycript -p APPLICATION injectURLProtocol.cy
```

Then open Console.app to see messages formatted like this:

```
1/1/70 00:00:00.000 Slack[83206]: Req: POST https://slack.com/api/api.test?error= Headers: {
    "Content-Type" = "application/x-www-form-urlencoded";
    Origin = "file://";
    "User-Agent" = "...";
}
```

**NOTE**: To make it easier to just see these requests, you can filter
by searching for `Req:`

## Alternatives

Depending on what else you're doing with cycript, you might actually be
better off using [`CFNETWORK_DIAGNOSTICS`][cfnetwork] which can provide
similar functionality without any addition configuration. You can simple
using this environment variable when launching the binary in question
like this:

```sh
$ CFNETWORK_DIAGNOSTICS=3 path/to/binary
```

### Warning

This script could print sensitive information into your console. Be
careful out there!

[brew]: http://brew.sh/
[cfnetwork]: https://developer.apple.com/library/mac/qa/qa1887/_index.html
[cycript]: http://www.cycript.org/
[protocol]: https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSURLProtocol_Class/index.html
[tap]: https://github.com/keith/homebrew-formulae
