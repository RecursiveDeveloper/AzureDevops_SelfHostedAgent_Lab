#!/bin/bash

AGENT_PACKAGE_URL=$1
AGENT_NAME=$2
AZ_ORG_URL_PATH=$3
AZ_DEVOPS_PAT=$4
PROJECT_NAME=$5

INSTALL_USER="vagrant"
TAGS="dev,vagrant"
AGENT_PATH="/opt/azagent"
TAR_FILE="vsts-agent-linux.tar.gz"

if [ -z "$AGENT_PACKAGE_URL" ] || [ -z "$AGENT_NAME" ] || [ -z "$AZ_ORG_URL_PATH" ] || [ -z "$AZ_DEVOPS_PAT" ] || [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <agent_package_url> <agent_name> <azure_devops_org_url> <azure_devops_pat> <project_name>"
    exit 1
fi

if [ ! -d "$AGENT_PATH" ]; then
    echo "Creating agent directory at $AGENT_PATH"
    sudo mkdir $AGENT_PATH
fi
cd $AGENT_PATH
sudo curl -fkSL $AGENT_PACKAGE_URL -o $TAR_FILE
sudo tar -zxvf $TAR_FILE >/dev/null 2>&1
sudo chown -R $INSTALL_USER:$INSTALL_USER $AGENT_PATH

if [ -x "$(command -v systemctl)" ];
then
    echo -e "\n********* Running as service *********\n";
sudo -i -u $INSTALL_USER bash << EOF
    ls -la
    echo -e "\n********* Running as $INSTALL_USER *********\n";
    cd $AGENT_PATH
    ls -la
    ./config.sh --deploymentgroup \
        --deploymentgroupname $DEPLOYMENTGROUP_NAME \
        --addDeploymentGroupTags \
        --deploymentGroupTags $TAGS \
        --unattended \
        --acceptteeeula \
        --agent $HOSTNAME \
        --url $AZ_ORG_URL_PATH \
        --work _work \
        --projectname $PROJECT_NAME \
        --runasservice \
        --auth pat \
        --token $AZ_DEVOPS_PAT;
EOF
    sudo ./svc.sh install;
    sudo ./svc.sh start;
fi
