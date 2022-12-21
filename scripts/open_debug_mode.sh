#!/bin/bash
echo "==========Enabling debug mode=========="
sed '1 adebugFlag=\"true\"' -i /u01/app/oracle/Domains/ExampleSilentWTDomain/bin/setDomainEnv.sh
sed '2 aexport debugFlag' -i /u01/app/oracle/Domains/ExampleSilentWTDomain/bin/setDomainEnv.sh
echo "==========Debug mode enabled=========="                                                                                                                                                                                                   
