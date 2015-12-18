Reproduct: cd into `UseFrameworksBug` and run

```$ pod install```

Result:

```
Updating local specs repositories
Analyzing dependencies
Fetching podspec for `MY` from `./`
Downloading dependencies
Using Google-Mobile-Ads-SDK (7.6.0)
Installing MY 1.0.0 (was 1.0.0)
[!] The 'Pods-UseFrameworksBug' target has transitive dependencies that include static binaries: (/Users/tim.kelly/code/fizzyartwerks/cocoapodsbug/UseFrameworksBug/Pods/Google-Mobile-Ads-SDK/GoogleMobileAdsSdkiOS-7.6.0/GoogleMobileAds.framework)
```

Notice here that the bug appears once you add Objective-C file to the files you are importing. Hence, if you remove the .m and .h files from Pods then the `pod install` will work.

Only workaround we know of is to install everything manually if you fall into this category:

1. Project with Swift
2. Cocoapods using `use_frameworks!`
3. pod install a sub-project that has Objective-C

Then you fail with `target has transitive dependencies that include static binaries`