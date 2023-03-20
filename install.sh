# Install Packages
sort -u alpine/world /etc/apk/world -o /etc/apk/world
apk update
apk add

# setup bind
mkdir /var/cache/bind
chown -R named:named /var/cache/bind
vi bind/named.conf
mv bind/named.conf /etc/bind/named.conf

# Setup tftp-hpa
curl https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe --output /var/tftpboot/netboot.xyz.kpxe
curl https://boot.netboot.xyz/ipxe/netboot.xyz.efi --output /var/tftpboot/netboot.xyz.efi

# Setup kea
vi kea/kea-dhcp4.conf  
mv kea/kea-dhcp4.conf /etc/kea/kea-dhcp4.conf