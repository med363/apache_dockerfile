FROM ubuntu:updated
RUN apt-get install -y apache2
RUN apt-get installl -y apache2-utils
EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
