require "erb"
require "fileutils"
_target = ARGV[0]
template = open("template.erb").read
config = ERB.new(template).result
puts config
open("/etc/nginx/nginx.conf", "w"){|f| f.puts config }
FileUtils.mkdir_p "/run/nginx"
system "nginx"
system "tail -f /var/log/nginx/*.log"
