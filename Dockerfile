# 使用 php:7.4-apache 作為基本映像
FROM php:7.4-apache

RUN apt-get update && apt-get install vim

# 啟用 Apache 的 rewrite 模組
RUN a2enmod rewrite

# 安裝 pdo 和 pdo_mysql 擴展
RUN docker-php-ext-install pdo pdo_mysql

# 定義容器的工作目錄為 /var/www/html（任何命令執行都在這個目錄下）
WORKDIR /var/www/html

# 容器運行時暴露的端口
EXPOSE 80

# RUN
# docker build -t apache-yii .
# docker run -d --name apache-base apache-yii
# 系統管理員身分執行
# docker cp apache-base:/etc/apache2 %cd%/
# docker rm apache-base
# docker run -d -p 80:80 --name apache-yii -v %cd%/apache2:/etc/apache2 -v %cd%/html:/var/www/html -v %cd%/framework:/var/framework apache-yii