FROM eclipse-temurin:17.0.6_10-jre

RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates wget unzip curl bash jq && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt

RUN cd /opt \
      && export PMD_URL=$(curl --silent https://api.github.com/repos/pmd/pmd/releases/latest | jq '.assets[] | select(.name | contains("pmd-bin-") and contains(".zip")) | .browser_download_url' | sed -e 's/^"//' -e 's/"$//') \
      && wget -nc -O pmd.zip ${PMD_URL} \
      && unzip pmd.zip \
      && rm pmd.zip \
      && mv pmd-bin* pmd

RUN cd /opt \
      && export CS_URL=$(curl --silent https://api.github.com/repos/checkstyle/checkstyle/releases/latest | jq '.assets[] | select(.name | contains("checkstyle-") and contains(".jar")) | .browser_download_url' | sed -e 's/^"//' -e 's/"$//') \
      && wget -nc -O checkstyle.jar ${CS_URL}

COPY run_pmd.sh /opt
COPY run_cpd.sh /opt
COPY ruleset.xml /opt
COPY run_checkstyle.sh /opt
