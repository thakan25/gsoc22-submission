# gsoc22-submission

## Project Description

The project here was about service discovery optimization in cups-filters driverless and cups-browsed utility. Initially driverless utility used CUPS ippfind to fetch active ipp compliant services(Printers, Fax), which in turn was using avahi apis for service discovery. So to optimize this process following 4 steps needed to be carried out:
1. Create a separate module for using avahi apis, functions to browse, resolve services
2. Find all implementations of avahi for service-discovery in both cups and cups-filters.
3. Use APIs built in step #1 wherever it is possible. Mainly in driverless utility to avoid ippfind call from the same
4. Add filters to these apis to avoid resolving same service multiple times(since resolving a service is time consuming step). Choose ipps over ipp protocol, IPv4 over IPv6 wherever possible 
