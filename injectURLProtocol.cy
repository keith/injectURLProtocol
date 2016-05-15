@import org.cycript.NSLog;

function loadURLProtocol() {
  @implementation InterceptURLProtocol : NSURLProtocol {}

  + (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog("Req: " + request.HTTPMethod + " " + request.URL +
          " Headers: " + request.allHTTPHeaderFields);

    return NO;
  }

  @end
}

function injectURLProtocol() {
  try {
    [InterceptURLProtocol class];
  } catch (e) {
    loadURLProtocol();
  }

  [NSURLProtocol registerClass:[InterceptURLProtocol class]];
  NSLog("Injected custom NSURLProtocol");
}

injectURLProtocol();
