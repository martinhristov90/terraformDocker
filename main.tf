                
# Getting Nginx image.
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}
# Running two Nginx containers.
resource "docker_container" "nginx-server" {
  count = 2
  # Naming containers nginx-server-1 and nginx-server-2
  name = "nginx-server-${count.index+1}"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/vargrant/html_docs"
    read_only = true
  }
}
