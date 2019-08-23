FROM alt:sisyphus

RUN apt-get update && apt-get -y install apt rpm hasher && apt-get -y dist-upgrade && apt-get clean
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]
