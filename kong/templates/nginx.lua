return [[
> if nginx_user ~= "nobody" and nginx_user ~= "nobody nobody" then
user ${{NGINX_USER}};
> end
worker_processes ${{NGINX_WORKER_PROCESSES}};
daemon ${{NGINX_DAEMON}};

pid pids/nginx.pid;
error_log logs/error.log ${{LOG_LEVEL}};

> if nginx_optimizations then
worker_rlimit_nofile ${{WORKER_RLIMIT}};
> end

events {
> if nginx_optimizations then
    worker_connections ${{WORKER_CONNECTIONS}};
    multi_accept on;
> end
}

http {
    include 'nginx-kong.conf';
}
]]
