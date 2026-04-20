---
## 🚀 About Me
I'm a junior DevOps engineer with some expertise in BackEnd development using Java and Node.js; scripting skills with Python, Bash and JavaScript; besides CI/CD and cloud knowledge of AWS and Azure DevOps tools ...

<p align="center">
<img src="https://c4.wallpaperflare.com/wallpaper/694/164/1000/digital-art-animals-eagle-bird-of-prey-birds-hd-wallpaper-preview.jpg" alt="Logo" width="400" height="230">
</p>

![linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![javascript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![nodejs](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)
![mysql](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)
![aws](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![azuredevops](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)

## 🔗 Portfolio
[![portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RecursiveDeveloper)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jhoan-jesus-ortiz-sandoval-a66152198/)

# Azure DevOps Self-Hosted Agent Lab

Spin up your own Azure DevOps self-hosted agent using Vagrant and VirtualBox. A Ubuntu VM is provisioned automatically and a Bash script handles the full agent installation, configuration, and registration against your Azure DevOps organization using a Personal Access Token (PAT). The agent is registered to the Default pool and runs as a system service, ready to pick up pipeline jobs.

![image](https://raw.githubusercontent.com/RecursiveDeveloper/static-media-content/refs/heads/main/AzureDevops_SelfHostedAgent_Lab-Diagram.png)

## Tech Stack

- **Client:** ---
- **Server:** Ubuntu 22.04 (Jammy), Bash
- **Database:** ---
- **Cloud provider:** Azure DevOps
- **Tools:** Vagrant, VirtualBox, Azure Pipelines Agent

## Installation

1. Install VirtualBox according to your O.S [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install Vagrant according to your O.S [Install Vagrant](https://developer.hashicorp.com/vagrant/install)
3. Generate a Personal Access Token (PAT) in Azure DevOps with **Agent Pools (Read & manage)** scope [Create a PAT](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate)

## Deployment

To deploy this project follow the next steps:

1) Open `Vagrantfile` and set the three variables at the top with your own values:

```ruby
AGENT_NAME = "my-agent"
AZ_ORG_URL_PATH = "https://dev.azure.com/your_organization"
AZ_DEVOPS_PAT = "your_pat_token"
```

2) Start the VM and provision the agent:

```bash
vagrant up
```

3) To stop the VM:

```bash
vagrant halt
```

4) To destroy the VM and clean up resources:

```bash
vagrant destroy
```

For more information about Vagrant commands check
- [Vagrant CLI](https://developer.hashicorp.com/vagrant/docs/cli)
- [Azure DevOps Self-hosted Linux agents](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent)

## Document Structure

```
AzureDevops_SelfHostedAgent_Lab/
├── Vagrantfile          # VM definition and provisioning config
├── install_agent.sh     # Agent download, configuration and service setup
└── README.md
```

## Authors

- [@RecursiveDeveloper](https://github.com/RecursiveDeveloper)

## License

[MIT](https://choosealicense.com/licenses/mit/)
