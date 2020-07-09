# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ckakuna <ckakuna@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/09 12:18:37 by ckakuna           #+#    #+#              #
#    Updated: 2020/07/09 13:00:07 by ckakuna          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER ckakuna <ckakuna@student.21-school.ru>

RUN apt-get update && apt-get upgrade
RUN apt-get install -y default-mysql-server nginx php php-fpm php-mysql openssl wget vim

RUN service nginx start && service mysql start && service php7.3-fpm start

COPY ./srcs/start.sh /etc
COPY ./srcs/default /etc
COPY ./srcs/ssl.txt /etc
COPY ./srcs/wp-config.php /var
COPY ./srcs/main.html /var/www

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["bash", "/etc/start.sh"]
