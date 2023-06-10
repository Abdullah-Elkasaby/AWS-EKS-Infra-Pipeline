
variable "public-instances-subnets-ids" {
  type = list(any)
}

variable "instances-security-group-ids" {
  type = list(any)
}



variable "jump-host-user-data" {
  # install kubectl and awscli
  default = <<-EOF
        #!/bin/bash
        apt update -y
        curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
        chmod +x ./kubectl
        mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
        echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        apt install unzip -y
        unzip awscliv2.zip
        ./aws/install
      EOF

}
