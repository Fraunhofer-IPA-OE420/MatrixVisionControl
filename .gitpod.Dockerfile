FROM gitpod/workspace-full
USER root

RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add - \
     && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
     && apt-get update \
     && apt-get install -y tailscale

# download the standalone balena-cli
RUN curl -s https://api.github.com/repos/balena-io/balena-cli/releases/latest \
	| grep "linux" \
	| cut -d : -f 12,3 \
	| tr -d \" \
	| xargs -I {} sh -c "wget https:{}"
RUN sudo unzip *-standalone.zip 

ENV IN_DOCKER=true

USER gitpod
WORKDIR /data


