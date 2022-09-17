# Tax  proxy

# 更新日志

```
2022-05-30     	    2.0.0>>>
			1. 更新了抽水算法，通过gpu_pool_mode和asic_pool_mode来控制平滑抽水，抽水机不再心电图
			2. 新增了拒绝率优化功能，使btc等专业机抽水时拒绝率进一步优化，提高收益
			3. 新增了内置于币印盒子的内置抽水的特殊版本
			4. 新增了自定义证书配置，支持凤凰内核的ssl连接
			5. 本地端更名为local.connector，去除tax等抽水标识
			6. 优化了多人抽水逻辑，使其更加合理
			7. 支持了DCR,ZEC的抽水
			8. 重新开放了web端

```

# 项目介绍

# 支持币种（2.0版本更新）:

目前支持币种：eth/etc/rvn/erg/cfx/btc/ltc/scp/bch/ton/dcr/ckb/zec

本项目仅供学习交流，实验测试原理使用。

# 使用方法

## Liunx一键管理工具 包含安装/启动/停止/删除/更新

**一键脚本使用视频教程  [https://www.youtube.com/watch?v=_anWdQ0Qn7c](https://www.youtube.com/watch?v=_anWdQ0Qn7c)**

**执行命令生成 管理控制脚本**

```
bash <(curl -s -L https://raw.githubusercontent.com/tax2022/tax_miner_proxy/master/gen.sh)
```

**反复执行上面的命令，输入不同路径，可以生成多个不同的管理脚本，控制多个矿池链接：**

![](images/path.jpg)

**根据提示启动管理控制脚本，不同名字的管理脚本控制不同矿池链接：**

**管理控制脚本：**

```bash
/root/tax-miner-proxy-tax-linux.sh
```

安装后，**修改config.yaml文件，改成你需要的矿池和钱包**，再通过管理脚本来启动服务。

**查看后台运行情况:**

```
tail -f /tmp/tax_proxy--端口.stat.log
```

## 手动安装

**Windows直接网页下载项目，Linux或ubuntu系统下载项目：**

```
git clone https://github.com/tax2022/tax_miner_proxy.git
cd tax_miner_proxy/linux
```

# 开发费用

**开发费用**：在用户抽水10%以内时，开发费随着用户抽水比例线性浮动，范围为0.25%-0.75%，超过10%时则为用户抽水比例的1/10。
