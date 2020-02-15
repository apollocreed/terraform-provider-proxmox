FROM hashicorp/terraform:0.12.20

ARG CI_PROJECT_URL
LABEL name="terraform proxmox"                                                    \
      description="a provider for proxmox"                                             \
      url=$CI_PROJECT_URL                                                 \
      maintainer="marc.abel.bisch@gmail.com"

ENV container docker

RUN apk update --no-cache && \
    apk --no-cache --update add ca-certificates \
                                curl  \
                                go \
                                jq    \
                                unzip \
                                git   \
                                wget

WORKDIR /terraform
ENV GOPATH /terraform
RUN  mkdir plugins &&\
     export TF_PLUGIN_CACHE_DIR="/terraform/plugins" &&\
     go get github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox &&\
     go get github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox &&\
     mv $GOPATH/bin/terraform-provider-proxmox /terraform/plugins         &&\
     mv $GOPATH/bin/terraform-provisioner-proxmox /terraform/plugins       &&\
     chmod 750 /terraform/plugins/terraform-provider-proxmox                  &&\
     chmod 750 /terraform/plugins/terraform-provisioner-proxmox                  &&\
     terraform providers                &&\
     unset http_proxy                                                                       &&\
     unset https_proxy

ENTRYPOINT [""]
USER root
# Default command to display terraform version
CMD [ "terraform", "version" ]

