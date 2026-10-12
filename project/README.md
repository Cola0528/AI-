# 1.0.16 Lua 工程快照

本目录按已交付的 `AI-Tower-1.0.16-Lua-源码与审查.zip` 展开，方便直接查看、比较和修改源码。地图成品放在上级 [`maps/`](../maps/)，ZIP 保留在 [`sources/`](../sources/)；`AI-v19-UI2.w3x` 是构建所需底图，不是本次推荐测试成品。

本次仅上传已有交付内容，没有改变 1.0.16 游戏逻辑或重新生成地图。原检查记录是 2026-10-08 的构建记录。

## 从哪里修改

- `lua_src/aitower/core/runtime.lua`：Lua 引擎适配与 native 绑定。
- `lua_src/aitower/game/`：房间/小游戏生命周期、同步操作和只读联机诊断。
- `lua_src/aitower/ui/`：界面布局、控件与交互。
- `v18_extract/war3map.j`：转换输入，保留原始规则。
- `lua_build/aitower/generated/`：转换产物，避免直接编辑。
- `tests/` 与 `audit/`：模型检查及交付时的验证证据。

## 验证与构建

在本目录运行。需要 Python 3 和 Lua 5.4；现有脚本仍保留原 Windows 构建机的路径。迁移到另一台电脑时须先配置依赖或调整这些路径，**不能认为任意电脑克隆后都能一键构建**：

- `tools/build_lua.py` 使用 Warcraft 的 `common.j` / `Blizzard.j`，原路径位于 `C:/Project/爬塔/analysis/audit/engine-defaults/`。
- `tools/lua_migration/bundle.py` 使用 `C:/AI/Lua54/luac.exe`。
- `tools/native_archive_check.py` 使用原机 `C:/Project/爬塔/tools/vendor/stormlib/x64/StormLib.dll`。
- 资源校验、原生 PJASS 及图像资源构建也需要相应 Warcraft/本地工具环境。它们不属于联网自动安装步骤。

已有生成脚本可直接用于 Lua 5.4 的模型回归：

```text
lua tests/lua_behavior.lua
lua tests/lua_controls.lua
lua tests/lua_ui.lua
lua tests/lua_rooms.lua
lua tests/lua_random_rooms.lua
lua tests/lua_minigames.lua
lua tests/lua_multiplayer.lua
```

修改规则后，先运行 `python tools/build_lua.py`，再运行模型检查。`check_ui_resources.py` 读取 UI 检查生成的记录，须在 UI 检查完成后运行；随后运行 `tools/lua_migration/bundle.py`、`tests/lua_packed.lua`、PJASS 和 `tools/package_lua.py`。资源图像发生变化时，还须先运行相应资源生成脚本。

发布新版本前应更新版本目标、交付说明和校验记录，使用新的地图文件名，保留旧成品。`tools/lua_migration/release_1016.py` 是原机一次性版本切换记录，不是克隆工程后的通用启动命令。

这些测试模拟了引擎接口，不能替代 Warcraft/KK 实机、多机联机与云存档验收。详细边界见 [本版审查](../docs/1.0.16-联机修复审查.md)。
