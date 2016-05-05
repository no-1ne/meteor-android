FROM codenvy/ubuntu_android

RUN sudo apt-get update && \
  sudo apt-get install -y curl && \
  curl https://install.meteor.com/ | sh && \
  echo y | android update sdk --all --force --no-ui --filter platform-tools,tools,build-tools-22.0.1,android-23,android-22,android-21
     
EXPOSE 3000
CMD tail -f /dev/null
