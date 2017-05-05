# Perfect SysInfo [简体中文](README.zh_CN.md)

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involved with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

This project provides a Swift library to monitor system performance.

This package builds with Swift Package Manager and is part of the [Perfect](https://github.com/PerfectlySoft/Perfect) project but can also be used as an independent module.

Ensure you have installed and activated the latest Swift 3.1 tool chain.

## Quick Start

Add Perfect SysInfo library to your Package.swift:

``` swift

.Package(url: "https://github.com/PerfectlySoft/Perfect-SysInfo.git", majorVersion: 1)

```

Add library header to your source code:

``` swift

import PerfectSysInfo

```

Now SysInfo class is available to call.

### CPU Usage

Call static variable `SysInfo.CPU` will return a dictionary `[String: [String: Int]]` of all CPU usage, for example:

``` swift

print(SysInfo.CPU)

/*
here is a typical return of single CPU:

[
  "cpu0":
    ["nice": 1201, "system": 3598, "user": 8432, "idle": 8657606],
  "cpu":
    ["nice": 1201, "system": 3598, "user": 8432, "idle": 8657606]
]

and the following is another example with 8 cores:
[
  "cpu3":
    ["user": 18095, "idle": 9708265, "nice": 0, "system": 16177],
  "cpu5":
    ["user": 18032, "idle": 9708329, "nice": 0, "system": 16079],
  "cpu7":
    ["user": 18186, "idle": 9707892, "nice": 0, "system": 16285],
  "cpu":
    ["user": 344301, "idle": 9201762, "nice": 0, "system": 196763],
  "cpu0":
    ["user": 730263, "idle": 8387000, "nice": 0, "system": 626684],
  "cpu2":
    ["user": 648287, "idle": 8799969, "nice": 0, "system": 294749],
  "cpu1":
    ["user": 17708, "idle": 9708996, "nice": 0, "system": 15950],
  "cpu4":
    ["user": 647701, "idle": 8800643, "nice": 0, "system": 294544],
  "cpu6": ["user": 656136, "idle": 8793002, "nice": 0, "system": 293640]]
*/

```

The record is a structure of `N+1` entries, where `N` is the number of CPU and `1` is the summary, so the each record will be tagged with "cpu0" ... "cpuN-1" and the tag "cpu" represents the average of overall. Each entries will contain `idle`, `user`, `system` and `nice` to represent the cpu usage time. In a common sense, `idle` shall be as large as possible to indicate the CPU is not busy.

### Memory Usage

Call static property `SysInfo.Memory` will return a dictionary `[String: Int]` with memory metrics in ** MB **:

``` swift

print(SysInfo.Memory)

```

** Note ** Since system information is subject to operating system type, so please use directive `#if os(Linux) #else #endif` determine OS type before reading system metrics; The definition of each counter is out of the scope of this document, please see OS manual for detail.

Typical Linux memory looks like this ( 1G total memory with about 599MB available):

```
[
  "Inactive": 283, "MemTotal": 992, "CmaFree": 0,
  "VmallocTotal": 33554431, "CmaTotal": 0, "Mapped": 74,
  "SUnreclaim": 14, "Writeback": 0, "Active(anon)": 98,
  "Shmem": 26, "PageTables": 7, "VmallocUsed": 0,
  "MemFree": 98, "Inactive(file)": 179, "SwapCached": 0,
  "HugePages_Total": 0, "Inactive(anon)": 104, "HugePages_Rsvd": 0,
  "Buffers": 21, "SReclaimable": 39, "Cached": 613,
  "Mlocked": 3, "SwapTotal": 1021, "NFS_Unstable": 0,
  "CommitLimit": 1518, "Hugepagesize": 2, "SwapFree": 1016,
  "WritebackTmp": 0, "Committed_AS": 1410, "AnonHugePages": 130,
  "DirectMap2M": 966, "Unevictable": 3, "HugePages_Surp": 0,
  "Dirty": 3, "HugePages_Free": 0, "MemAvailable": 599,
  "Active(file)": 426, "Slab": 54, "Active": 525,
  "KernelStack": 2, "VmallocChunk": 0, "AnonPages": 177,
  "Bounce": 0, "HardwareCorrupted": 0, "DirectMap4k": 57
]
```

And here is a typical mac OS X memory summary, which indicates that there is about 4.5GB free memory:

```
[
  "hits": 0, "faults": 3154324, "cow": 31476,
  "wired": 3576, "reactivations": 366, "zero_filled": 2296248,
  "pageins": 13983, "lookups": 1021, "pageouts": 0,
  "active": 6967, "free": 4455, "inactive": 1008
]

```

### Network Traffic

Call static property `SysInfo.Net` will return total traffic summary from all interfaces as a tuple array `[(interface: String, i: Int, o: Int)]` where interface represents the network interface name, `i` stands for receiving and `o` for transmitting, both in KB:

``` swift

if let net = SysInfo.Net {
  print(net)
}

```

If success, it will print something like these mac  / linux outputs:

```
// typical mac os x network summary, where the only physical network adapter "en0" has 2MB incoming data totally.
[
  (interface: "lo0", i: 1030, o: 0),
  (interface: "gif0", i: 0, o: 0),
  (interface: "stf0", i: 0, o: 0),
  (interface: "en0", i: 2158, o: 0),
  (interface: "en1", i: 0, o: 0),
  (interface: "en2", i: 0, o: 0),
  (interface: "bridge0", i: 0, o: 0),
  (interface: "p2p0", i: 0, o: 0),
  (interface: "awdl0", i: 9, o: 0),
  (interface: "utun0", i: 0, o: 0),
  (interface: "vboxnet0", i: 26, o: 0)
]

// typical linux network summary, where the only physical network adapter "enp0s3" has received 4MB data and sent out 74KB in the same time.
[
  (interface: "enp0s8", i: 527, o: 901),
  (interface: "enp0s3", i: 4354, o: 74),
  (interface: "lo", i: 840, o: 840),
  (interface: "virbr0", i: 0, o: 0),
  (interface: "virbr0-nic", i: 0, o: 0)
]
```

## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)

## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).


## Now WeChat Subscription is Available (Chinese)
<p align=center><img src="https://raw.githubusercontent.com/PerfectExamples/Perfect-Cloudinary-ImageUploader-Demo/master/qr.png"></p>
