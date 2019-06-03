## This reposistory is created with learning purposes for Terraform, focusing on Terraform Docker provider.

## Purpose :

- It provides a simple example of how to run two Docker Nginx containers using Terraform.

## Pre-requisites :

- This repository relies on HashiCorp Vagrant, instructions how to install it can be found [here](https://www.vagrantup.com/docs/installation/).
- For convenience, Terraform and Docker are pre-installed in the Vagrant box provided in this repository.

## How to use it :

- In a directory of your choice, clone the github repository :
    ```
    git clone https://github.com/martinhristov90/terraformDocker.git
    ```

- Change into the directory :
    ```
    cd terraformDocker
    ```

- Start the Vagrant box by executing :
    ```
    vagrant up
    ```
- It might take few minutes for Vagrant to power on the box and provision it.
- When Vagrant is finished successfully, you can SSH into the machine with :
    ```
    vagrant ssh
    ```
- Now you are inside the box itself, you can run `sudo docker ps` to verify that Docker is installed and no containers are running at the moment.
- Change into directory `/home/vagrant/outerDir`, this directory is mapped to the root directory of the project.
- Now, Terraform can be used to run Docker containers. Run `terraform init` to install the Docker provider.
- When Terraform is finished downloading the Docker provider you can run `sudo terraform plan`, the output should look like this :
    ```
    ---SNIP---
      + create

    Terraform will perform the following actions:

      + docker_container.nginx-server[0]
        ---SNIP---

      + docker_container.nginx-server[1]
        ---SNIP--- 

      + docker_image.nginx
          id:                                <computed>
          latest:                            <computed>
          name:                              "nginx:1.11-alpine"


    Plan: 3 to add, 0 to change, 0 to destroy.

    ------------------------------------------------------------------------
    ```
- As you can see Terraform warns that 3 resources are going to be created, one of them is the actual Docker image form which the two Nginx containers are going to be created.
- Run `sudo terraform apply` to download the Docker image in run the containers.
- You can verify with `sudo docker ps` that two Nginx Docker containers are actually running. The output should look like this :
    ```
    PORTS               NAMES
    ce33c65c1e91        bedece1f06cc        "nginx -g 'daemon of…"   About a minute ago   Up About a minute   443/tcp,  0.0.0.0:32769->80/tcp   nginx-server-1
    92d8b74d2335        bedece1f06cc        "nginx -g 'daemon of…"   About a minute ago   Up About a minute   443/tcp,  0.0.0.0:32768->80/tcp   nginx-server-2
    ```
- To destroy the resources created by Terraform, you can type `terraform destroy`.




