#!/bin/bash

AGENT_NAME=$1
AZ_ORG_URL_PATH=$2
AZ_DEVOPS_PAT=$3

INSTALL_USER="vagrant"
TAGS="dev,vagrant"
AGENT_PATH="/opt/azagent"
AGENT_PACKAGE_URL="https://download.agent.dev.azure.com/agent/4.271.0/vsts-agent-linux-x64-4.271.0.tar.gz"
TAR_FILE="vsts-agent-linux.tar.gz"

if [ -z "$AGENT_NAME" ] || [ -z "$AZ_ORG_URL_PATH" ] || [ -z "$AZ_DEVOPS_PAT" ]; then
    echo "Usage: $0 <agent_name> <azure_devops_org_url> <azure_devops_pat>"
    exit 1
fi

if [ ! -d "$AGENT_PATH" ]; then
    echo "Creating agent directory at $AGENT_PATH"
    sudo mkdir $AGENT_PATH
fi

cd $AGENT_PATH
sudo curl -fkSL $AGENT_PACKAGE_URL -o $TAR_FILE
sudo tar -zxvf $TAR_FILE >/dev/null 2>&1
sudo rm -f $TAR_FILE
sudo chown -R $INSTALL_USER:$INSTALL_USER $AGENT_PATH

sudo -i -u $INSTALL_USER bash << EOF
    cd $AGENT_PATH
    if [ -f "$AGENT_PATH/.agent" ]; then
        echo -e "\nRemoving existing agent configuration...\n"
        sudo ./svc.sh uninstall
        ./config.sh remove --unattended \
            --auth pat \
            --token $AZ_DEVOPS_PAT
    fi
    ./config.sh --unattended \
        --url $AZ_ORG_URL_PATH \
        --auth pat \
        --token $AZ_DEVOPS_PAT \
        --pool Default \
        --agent $AGENT_NAME \
        --acceptTeeEula true \
        --work _work \
        --replace
EOF
sudo ./svc.sh install
sudo ./svc.sh start