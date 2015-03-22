FROM ubuntu:trusty
MAINTAINER = Jason M. Mills <jmmills@cpan.org>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
  trac \
  trac-accountmanager \
  trac-customfieldadmin \
  trac-xmlrpc \
  trac-wikiprint \
  trac-wysiwyg \
  trac-mastertickets \
  trac-tags \
  trac-diavisview \
  trac-announcer \
  trac-batchmodify \
  trac-graphviz python-flu

ADD setup_trac_config.sh /.setup_trac_config.sh
ADD setup_trac.sh /.setup_trac.sh
ADD run.sh /run.sh
ADD trac_logo.png /var/www/trac_logo.png

ADD set_trac_user_password.py /usr/local/bin/
RUN chmod 755 /usr/local/bin/set_trac_user_password.py

EXPOSE 80
CMD ["/run.sh"]
