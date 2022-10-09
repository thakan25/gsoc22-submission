# GSoC22-Final Report,
### Open Printing @ The Linux Foundation
**Author** : Sachin Thakan
## Project Description
 
The project here was about service discovery optimization in cups-filters driverless and cups-browsed utility. Initially, driverless utility used CUPS ippfind to fetch active ipp compliant services(Printers, Fax), which used avahi APIs for service discovery. So to optimize this process following 4 steps needed to be carried out:
1. Using avahi APIs and creating a separate library containing functions to browse, resolve services, etc.
2. Find all the places in both cups and cups-filters where avahi APIs are getting used(for service discovery)
3. Use APIs built in step #1 wherever it is possible. Mainly in driverless utility to avoid using ippfind for service discovery
4. Add filters to these APIs to avoid resolving the same service multiple times(since resolving the service is a time-consuming step). Choose ipps over ipp protocol, IPv4 over IPv6 wherever possible
 
 
## Progress
 
### 1st Half
The first half of the project saw the following progress:
1. I went through the cups and cups-filters codebase to see the suitable place where incoming APIs can be used. Apart from ippfind and driverless utility, I found several places where avahi APIs were used in bits and pieces. [Here](https://plump-leader-88e.notion.site/1-code-repetition-ec510f7a23e74271997865e7237fcdcc) is some description about the same
2. I created a separate header and source with minimal APIs to browse, and resolve services. Made changes to ippfind and implemented new APIs to the same.
 
 
### 2nd Half
Following is the progress in second half
1. Refactored driverless utility to use avahi APIs directly rather than ippfind utility. Worked on optimizing the process by resolving only relevant services.  
 
### Bugs and Improvements
Following are the improvements which can be made to work done:
1. Better logging and error handling
2. Making avahi implementation of driverless utility more flexible(responding to different command line options)
 
### Changes in Project Scope along with the timeline
My work was focused on both cups and cups-filters. Adding optimized APIs in cups and making use of those in both cups and cups-filters. As we went through the timelines, it became evident that for cups, it was a major change to get introduced anytime soon. So It was planned to release in cups 3.x series of release.
 
Subsequently, I made changes to the cups-filters driverless utility, which will be using my avahi library instead of ippfind. cups-filters 2.x will still be compatible with cups 2.x, and for a long enough time, these apis will serve their purpose until they are needed to migrate to cups 3.x.
 
### Link to Pull requests
* https://github.com/OpenPrinting/cups-filters/pull/487
* https://github.com/OpenPrinting/cups/pull/434
 
### Repo Links
* [cups_fork](https://github.com/thakan25/cups/tree/avahi-optimization-sachin-thakan-archieve)
* [cups-filters_fork](https://github.com/thakan25/cups-filters/tree/driverless-avahi-optimization-archieve)
