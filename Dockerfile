# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ckakuna <ckakuna@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/08 22:02:11 by ckakuna           #+#    #+#              #
#    Updated: 2020/07/08 22:14:34 by ckakuna          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER ckakuna <ckakuna@student.21-school.ru>
RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx default-mysql-server php php-fpm php-mysql openssl wget
RUN service nginx start && service mysql start && service php7.3-fpm start
COPY ./srcs/init_settings.sh ./
COPY ./srcs/default ./
COPY ./srcs/ssl.txt ./
COPY ./srcs/wp-config.php /var
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["bash", "./init_settings.sh"]