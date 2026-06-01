# marzban-rules-pack

用于给 Marzban 的 Clash/Mihomo 订阅模板快速套用一套分流规则。

## 文件说明

- `rules.list`: 纯规则清单（可直接拼接到 `rules:` 下面）
- `rules.yml`: 带 `rules:` 头的 YAML 版本
- `apply_to_marzban.sh`: 一键应用脚本（会自动备份原模板）

## 在另一台 Marzban 机器上应用

### 1. 复制目录到目标机器

```bash
scp -r /root/marzban-rules-pack root@<TARGET_IP>:/root/
```

### 2. 登录目标机器执行

```bash
ssh root@<TARGET_IP> 'bash /root/marzban-rules-pack/apply_to_marzban.sh'
```

## 脚本做了什么

会更新以下两个模板文件中的 `rules:` 段，其他内容保持不变：

- `/var/lib/marzban/templates/clash/rules.yml`
- `/var/lib/marzban/templates/clash/meta-rules.yml`

每次执行都会先自动备份：

- `*.bak.YYYY-MM-DD-HHMMSS`

## 生效方式

服务端模板更新后，客户端侧执行一次订阅更新即可生效。

## 可选参数

如果你想指定其他规则文件：

```bash
bash /root/marzban-rules-pack/apply_to_marzban.sh /path/to/your-rules.list
```
