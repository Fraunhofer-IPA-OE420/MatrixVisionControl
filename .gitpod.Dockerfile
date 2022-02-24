FROM gitpod/workspace-full
USER root

#COPY requirements.txt .

RUN apt-get update
RUN apt-get install -y python-dev
RUN pip install -r requirements.txt

# install tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# download the standalone balena-cli
RUN curl -s https://api.github.com/repos/balena-io/balena-cli/releases/latest \
	| grep "linux" \
	| cut -d : -f 12,3 \
	| tr -d \" \
	| xargs -I {} sh -c "wget https:{}"
     
RUN sudo unzip *-standalone.zip 

USER gitpod
WORKDIR /data

EXPOSE 5000
