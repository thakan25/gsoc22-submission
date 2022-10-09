# GSoC22-Final Report, 
### Open Printing @ The Linux Foundation
**Author** : Sachin Thakan
## Project Description

The project here was about service discovery optimization in cups-filters driverless and cups-browsed utility. Initially driverless utility used CUPS ippfind to fetch active ipp compliant services(Printers, Fax), which in turn was using avahi apis for service discovery. So to optimize this process following 4 steps needed to be carried out:
1. Create a separate module for using avahi apis, functions to browse, resolve services
2. Find all the place in both cups and cups-filters wher avahi apis are getting used(for service discovery)
3. Use APIs built in step #1 wherever it is possible. Mainly in driverless utility to avoid using ippfind for service discovery
4. Add filters to these apis to avoid resolving same service multiple times(since resolving a service is time consuming step). Choose ipps over ipp protocol, IPv4 over IPv6 wherever possible 


## Progress

### 1st Half
First half of project saw following progress:
1. I went through the cups and cups-filters codebase to see suitable place where incoming apis can be used. Apart from ippfind and driverless utility I found several place where avahi apis were used in bits and pieces. [Here](https://plump-leader-88e.notion.site/1-code-repetition-ec510f7a23e74271997865e7237fcdcc) is some description about the same
2. I created separate header and source with minimal apis to start with, to browse, resolve services. Made changes to ippfind and implemented new apis to the same.


### 2nd Half
Following is the progress in 2nd half
1. Refactored driverless utility to use avahi apis directly rather than using ippfind utility. (Note: This may lead to lesser flexibility in  term of playing with several attributes. WIP to overcome those limitations)

### Pending tasks
Following are the improvements which can be made to the work done:
1. Better logging and error handling
2. Making avahi implementation of driverless utility more flexible(responding to different command line options)

### Link to Pull requests
* https://github.com/OpenPrinting/cups-filters/pull/487
* https://github.com/OpenPrinting/cups/pull/434
