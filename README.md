# shadowsocks-libev-kcptun-docker

shadowsocks-libev image with integrated kcptun

## Operation mode

The following command will start Shadowsocks and kcptun on the `8388`(tcp & udp) and `29900`(udp) ports respectively with default values.
```
Docker run -d -p 8388:8388 -p 8388:8388/udp -p 29900:29900/udp geekza/shadowsocks-libev-kcptun
```

## Options

| Options | Parameter Description | Default |
| ------------- |:-------------:| -----:|
| --help | Help | None |
| -m, --ss-method METHOD | shadowsocks encryption algorithm | aes-256-cfb |
| -p, --ss-password PASSWORD | shadowsocks password | sspassword |
|-s, --kcptun-secret PASSWORD | kcptun secret | kcpsecret |
|-c, --kcptun-crypt CRYPT | kcptun encryption algorithm | aes |

### kcptun encryption algorithm:
aes, aes-128, aes-192, salsa20, blowfish, twofish, cast5, 3des, tea, xtea, xor, none

(salsa20 is recommended)

### shadowsocks encryption algorithms:
aes-128-gcm, aes-192-gcm, aes-256-gcm, aes-128-cfb, aes-192-cfb, aes-256-cfb, aes-128-ctr, aes-192-ctr, aes-256-ctr, camellia-128-cfb, camellia-192-cfb, camellia-256-cfb, bf-cfb, chacha20-ietf-poly1305, xchacha20-ietf-poly1305, salsa20, chacha20 and chacha20-ietf

(chacha20 is recommended)

Example:
```
Docker run -d -p 8388:8388 -p 29900:29900/udp geekza/shadowsocks-libev-kcptun \
    -m 'chacha20' -p 'yoursspassword' \
    -s 'yourkcppassword' -c 'salsa20'
```

## port

Service | Port | Type |
| ------------- |:-------------:| -----:|
Shadowsocks | 8388 | TCP |
Kcptun | 29900 | UDP |

## Configure Android application Plugin

- Install Shadowsocks application form GooglePlay:

https://play.google.com/store/apps/details?id=com.github.shadowsocks

- Install kcptun plugin for shadowsocks from GooglePlay:

https://play.google.com/store/apps/details?id=com.github.shadowsocks.plugin.kcptun

- Assume you have run docker like above example

- Create a connection with shadowsocks configs and enable DNS forwarding

|Option|Value|
| ------------- |:-------------:|
|Server|10.20.1.3|
|Remote Port|8388|
|Password:|yoursspassword|
|Encrypt Method|chacha20|
|DNS Forwarding|on|

- Configure kcptun plugin by this string:

remoteaddr=10.20.1.3:29900;key=yourkcppassword;rcvwnd=1024;sndwnd=1024;crypt=salsa20
