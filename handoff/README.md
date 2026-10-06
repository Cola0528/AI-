# 地图源码与工具交接

[下载完整交接包](https://github.com/Cola0528/AI-/raw/refs/heads/main/sources/AI-Tower-Handoff.zip)

直接把这个仓库地址交给接手AI，并让它先读本页、下载解压交接包。若它不能访问GitHub，直接传ZIP即可。


## 先确认继续修改的基准

用户已另行制作并确认**可运行的 v18**。该 v18 的文件和源码尚未提交到本仓库，本交接包也不包含它。拿到用户的 v18 后，先备份、核对能进入，再以其为后续修改基准；不要用这里的旧版本覆盖它。

本包保存的是此前工作材料：v12曾由用户重新实测可进入，v13～v17曾报告无法进入。v17在出现魔兽加载画面前被KK提示“游戏启动失败”；旧版编译和模拟检查通过不能证明它可在KK运行。

## 不必从零破解

.w3x是魔兽争霸III地图的容器扩展名，不等于内容加密；.w3m也是地图容器，并不是“源码格式”。本包v12的109个资源块均可以读取，脚本和SLK/文本数据已解包。

原图没有保留war3map.wtg/war3map.wct，也没有(listfile)。因此这里提供的是**可编辑的JASS和对象数据**，不能称为恢复了原作者的GUI触发器工程。59个资源已有文件名；另外50个按块编号保存，原压缩内容也完整保留在底包。无需猜测它们的名字即可继续修改脚本/物品数据。

## 目录

| 目录 | 用途 |
| --- | --- |
| base/ | AI-Tower-Team-Events-Monk-v12.w3x，用户此前实测可进入的原样文件。 |
| editable_v12/ | 实际v12地图解包：war3map.j、Units/*.slk、Units/*.txt、地形、字体及其他资源。_unnamed为尚未恢复名字的资源；extraction-manifest.json记录109个块的哈希。 |
| working_v12_sources/ | v12发布时的补丁生成器和验证程序。war3map-patched.j已核对与底包war3map.j逐字相同。 |
| latest_v17_sources/ | v17修改源码、生成结果和检查日志。**这是失败版本的研究材料，不是最新可用版本。** |
| v17_overlay/ | 相对v12变化的6份实际文件，用于对比v17回归，不要直接覆盖可运行v18。 |
| tools/w3x_tools.py | 新整理的读取、解包、替换已有文件工具；Python 3.9+，标准库加随包mpyq，无须DLL或pip安装。 |
| tools/vendor/ | mpyq 0.2.5及其MIT许可证。 |
| tools/legacy24/ | 旧版1.24接口定义，供已有pjass编译器检查；不是魔兽客户端，也不是编译器可执行文件。 |
| diagnostics/ | 工具自测和独立StormLib回读记录。 |

旧生成器使用/workspace/map-edit等绝对路径；换电脑时需调整路径或使用下面的便携工具编辑已解包文件。两份历史源码的SOURCE-README保留原版本记录，以本说明的版本状态为准。

## 便携工具示例

在解压后的AI-Tower-Handoff目录打开终端（Windows也可把python改为py -3）：

```sh
python tools/w3x_tools.py read base/AI-Tower-Team-Events-Monk-v12.w3x war3map.j copied-script.j
python tools/w3x_tools.py extract base/AI-Tower-Team-Events-Monk-v12.w3x new-extract
python tools/test_w3x_tools.py
```

直接编辑editable_v12/war3map.j或Units下的数据，然后从底包替换已有文件：

```sh
python tools/w3x_tools.py patch base/AI-Tower-Team-Events-Monk-v12.w3x my-edited-map.w3x --file war3map.j=editable_v12/war3map.j
```

必须有实际改动才会生成地图；输出已存在时拒绝覆盖。也可创建overlay目录，按war3map.j、Units/AbilityData.slk等真实内部路径放入待替换文件：

```sh
python tools/w3x_tools.py patch base/AI-Tower-Team-Events-Monk-v12.w3x my-edited-map.w3x --overlay overlay
```

该工具只支持本图使用的标准MPQ v0、zlib分块压缩和替换已有目录项，不新增文件，也不处理其它加密/压缩类型；遇到不支持格式会报错，需使用StormLib。保留原外部地图头、哈希表和未修改的压缩块。此处打包能力通过回读验证，**没有据此宣称KK加载成功**。尚未拿到用户的v18，不能保证其格式与本工具兼容。

工具检查：6项便携测试覆盖全部资源、压缩/非压缩扇区边界、空内容、路径越界和拒绝覆盖。原解包109个资源以及只追加JASS注释后的打包109个资源，均与独立StormLib读取结果一致。

## 给接手AI的任务上下文

用户已表示后来自行写出可运行v18，应先取得它。旧v13～v17崩溃根因未在此工作区证实，请勿重复把编译通过称为解决启动失败。历史v17删除了三转运行时改名，保留17条三转设计、第四轮开放、30木材+1000金币费用；用户后来的v18是否进一步调整，以其实际文件为准。

关于历史需求和具体职业设计，参考latest_v17_sources/修改说明与测试要点.md，以及third_design.py、third_combat.j、third_active.j。不要要求用户提供不存在的.w3m源图才能开始：当前已具备可读JASS、对象数据和可用的旧基准底包。

底包SHA-256：9bd5160683e8d4dec44a7af6c0094217fd43866e35e2d2667be281233a166554。
