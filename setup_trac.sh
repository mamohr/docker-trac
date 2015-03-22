#!/bin/bash

source /.setup_trac_config.sh

setup_trac() {
    [ ! -d /trac ] && mkdir /trac
    if [ ! -f /trac/VERSION ]
    then
        trac-admin /trac initenv "${PROJECT_NAME}" sqlite:db/trac.db
        setup_components
        setup_accountmanager
        setup_admin_user
        trac-admin /trac config set logging log_type stderr
        [ -f /var/www/trac_logo.png ] && cp -v /var/www/trac_logo.png /trac/htdocs/your_project_logo.png
    fi
}

clean_house() {
    if [ -d /.setup_trac.sh ] && [ -d /.setup_trac_config.sh ]
    then
        rm -v /.setup_trac.sh
        rm -v /.setup_trac_config.sh
    fi
}

setup_trac
clean_house
