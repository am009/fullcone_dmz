# 解决p2p联机游戏的NAT问题

之前想的是复杂的解决方案：Linux 内核增加full-cone的模块，实现full-cone。无奈校园网都不是全锥的。

本项目的直接解决方案：（需要一台有公网IP的云服务器）

1. 基于OpenVPN组网：https://gist.github.com/kimus/9315140
1. 基于iptables实现DMZ主机，转发1024-65535端口，应该够用了。连接OpenVPN后，执行`./add-iptables-rules.sh 192.168.1.6`(参数是连接后提示的IP地址)
1. 直接执行`add-iptables-rules.sh` 不带参数清除iptables规则。

测试：
1. NAT类型测试：https://github.com/HMBSbige/NatTypeTester
1. 尝试本机监听端口，然后其他机子连接同一端口

注意：
- 关闭服务器的安全组防火墙
