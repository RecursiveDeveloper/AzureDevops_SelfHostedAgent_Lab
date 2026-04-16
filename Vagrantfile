AGENT_PACKAGE_URL = "https://download.agent.dev.azure.com/agent/4.271.0/vsts-agent-linux-x64-4.271.0.tar.gz"
AGENT_NAME = "agent_name"
AZ_ORG_URL_PATH = "azure_devops_organization_url" #e.g. https://dev.azure.com/your_organization
AZ_DEVOPS_PAT = "azure_devops_personal_access_tokens"
PROJECT_NAME = "project_name"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.boot_timeout = 400
  config.vm.hostname = "devops"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "devops-agent"
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "./install_agent.sh", 
    args: "#{AGENT_PACKAGE_URL} #{AGENT_NAME} #{AZ_ORG_URL_PATH} #{AZ_DEVOPS_PAT} #{PROJECT_NAME}"
end