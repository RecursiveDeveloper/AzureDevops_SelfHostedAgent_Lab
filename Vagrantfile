AGENT_NAME = "agent_name" #e.g. my-agent
AZ_ORG_URL_PATH = "az_org_url_path" #e.g. https://dev.azure.com/your_organization
AZ_DEVOPS_PAT = "az_devops_pat"

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
    args: "#{AGENT_NAME} #{AZ_ORG_URL_PATH} #{AZ_DEVOPS_PAT}"
end