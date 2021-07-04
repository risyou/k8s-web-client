FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
ADD hello.conf /etc/nginx/conf.d/
ADD 1.html /usr/share/nginx/html/
ADD 2.html /usr/share/nginx/html/
RUN chown -R nginx:nginx /usr/share/nginx/html/
CMD env | grep kube | sed 's/=/<\/span> <span>/g' | while read line ; do echo '<p><span>'$line'</span></p>' ; done > /usr/share/nginx/html/env.txt &&\
cat /usr/share/nginx/html/1.html /usr/share/nginx/html/env.txt /usr/share/nginx/html/2.html > /usr/share/nginx/html/index.html;\
nginx -g 'daemon off;'
