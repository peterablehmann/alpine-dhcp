# Install Packages
sort -u alpine/world /etc/apk/world > /etc/apk/world
apk update
apk add

# setup bind
vi bind/named.conf
mv bind/named.conf /etc/bind/named.conf
rc-update add named
/etc/init.d/named start

# Setup tftp-hpa
curl https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe --output /var/tftpboot/netboot.xyz.kpxe
curl https://boot.netboot.xyz/ipxe/netboot.xyz.efi --output /var/tftpboot/netboot.xyz.efi
rc-update add in.tftpd
/etc/init.d/in.tftpd start

# Setup kea
vi kea/kea-dhcp4.conf  
mv kea/kea-dhcp4.conf /etc/kea/kea-dhcp4.conf
rc-update add kea-dhcp4
/etc/init.d/kea-dhcp4 start