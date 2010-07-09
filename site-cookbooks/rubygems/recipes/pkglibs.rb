#
# This is where you specify the packages that might be needed for gem native builds.
#

case node[:platform]
when "ubuntu", "debian"
  node[:gem][:pkglibs].each do |pkg|
    package "#{pkg}" do
      action :install
    end
  end
end