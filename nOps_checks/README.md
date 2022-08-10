# Check terraform project cost using nOps Pricing checkov check
1. Install python 3.9
   - Please refer [link](https://python.tutorials24x7.com/blog/how-to-install-python-3-9-on-mac) 
2. Install checkov pip package (Make sure you are using python 3.9 or above)
```shell
pip3 install checkov
```
2. Install nOps SDK
```shell
pip3 install --index-url https://test.pypi.org/simple/ nops-sdk==0.3.1 --extra-index-url https://pypi.org/simple
```   
3. Please refer [here](https://github.com/nops-io/nops-precommit-client#nops-cli) to install 
    nOps CLI and to set required enviornment variables
4. Clone current repository
```shell
git clone https://github.com/nops-io/github-sample-project.git
```
5. Change directory to 
```shell
cd github-sample-project/nOps_checks
```
6. Open terraform_project_check.yaml, update your terraform project path (you can use existing 
terraform projects available in the repo), threshold, operation as required.
7. Run following checkov command
```shell
checkov -f terraform_project_check.yaml --external-checks-dir pricing_checks
```
The above command will trigger the nOps pricing ckeckov check available in pricing_checks directory. This check will compute the total
cost for the project and will mark check PASS/FAIL based on threshold and operation configured in
terraform_project_check.yaml.

# Check encrypted volumes using nOps graphql checkov check
1. Install python 3.9
- Please refer [link](https://python.tutorials24x7.com/blog/how-to-install-python-3-9-on-mac)
2. Install nOps SDK
```shell
pip3 install --index-url https://test.pypi.org/simple/ nops-sdk --extra-index-url https://pypi.org/simple
```  
3. Set required enviornment variables 
   - NOPS_API_KEY - Your nOps account API key.
4. Run following checkov command
```shell
checkov -f dummy_graphql.yaml --external-checks-dir graphql_checks
```
This command will trigger the nOps graphql YAML checkov checks available in graphql_checks directory.
Check will use nOps graphql module to fetch all the ebs volumes with there encryption status and ids.
Check will fail if there is any volume without the encryption enabled. 