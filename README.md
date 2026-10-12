# AI爬塔

Warcraft III / KK 平台合作回合制爬塔地图。当前代码与交付版本为 **1.0.16 Lua**，于 **2026-10-12** 同步至本仓库。

- **[下载 1.0.16 地图](https://github.com/Cola0528/AI-/raw/refs/heads/main/maps/AI-Tower-1.0.16-Lua.w3x)**
- **[下载完整源码与审查包](https://github.com/Cola0528/AI-/raw/refs/heads/main/sources/AI-Tower-1.0.16-Lua-源码与审查.zip)**
- [本版改动、验证范围与联机诊断](docs/1.0.16-联机修复审查.md) · [文件 SHA256](docs/lua-1.0.16-sha256.txt)

1.0.16 修正 Lua 对象回收与计时器清理顺序中的联机隐患，并新增 `-sync` 诊断。90 组脚本模型、语法、资源和地图封包检查通过；**尚未完成 KK 双机实测，不能把模型检查当作实机验收，也不能保证此前的失步已彻底解决。**

两人联机应使用同一版本并重新开局。若发生血量或行动不一致，任意一人在聊天中输入一次 `-sync`，保留双方同编号的输出；同编号的签名可用于比较当次采样状态。

## 源码位置

| 目录 | 内容 |
| --- | --- |
| [project/lua_src](project/lua_src) | 手写 Lua 框架、关卡与小游戏流程、界面和联机诊断 |
| [project/lua_build](project/lua_build) | 生成的完整 Lua 规则、打包入口、界面资源及最小 JASS 启动器 |
| [project/tests](project/tests) | 规则、操作、界面、关卡和双端战斗模型检查 |
| [project/tools](project/tools) | 转换、资源检查、封包和源码交付工具 |
| [project/v18_extract](project/v18_extract) | 迁移所用的完整 JASS 规则和原资源索引 |
| [project/audit](project/audit) | 交付时的检查记录；其中的本机路径反映原构建环境 |
| [maps](maps) / [sources](sources) | 可下载地图 / 完整源码包，以及保留的历史交付 |

后续开发以 `project/` 为工程根目录，先看 [开发说明](project/README.md)。不要直接修改 `lua_build/aitower/generated` 中的生成文件；手写覆盖层位于 `lua_src/aitower`。

## 历史资料

旧 v17 曾被报告“游戏启动失败”，仅用于历史追溯，**不是当前推荐测试版本**。这些文件和历史提交均保留：

- [旧源码交接说明](handoff/README.md)
- [此前源码交接包](sources/AI-Tower-Handoff.zip)
- [旧改动与验证记录](docs/changes-and-testing.md)
- [旧 v17 修改源码包](sources/map-patch-and-validation.zip)
- [此前可运行的 v12 地图](https://github.com/Cola0528/AI-/raw/332dd9089a0e0e95d360cf4cc9231bd2817c6f99/maps/AI-Tower-Team-Events-Monk-v12.w3x)

地图、脚本模型以及 KK 原生运行时是不同的验证层级；请以版本审查说明中明确列出的验收范围为准。
