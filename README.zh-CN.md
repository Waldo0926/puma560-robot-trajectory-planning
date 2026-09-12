# PUMA 560 机器人运动学与轨迹规划

这是一个基于 MATLAB 的机器人学作品集项目，内容包括 **三维旋转表示、欧拉角与旋转矩阵转换、笛卡尔路径生成、轨迹插值、逆运动学，以及 PUMA 560 机器人仿真**，机器人部分使用 Peter Corke 的 Robotics Toolbox for MATLAB。

> 本仓库由 2023–2024 年完成的大学机器人学实验与课程设计重构而来。公开版不是简单上传原作业，而是对代码结构、命名、数学约定和文档进行了重新整理与修正，并将包含个人学籍信息的原始报告与公开 Git 仓库隔离。

[English README](README.md)

## 项目亮点

- 明确定义并实现 **Z-Y-X** 与 **Z-Y-Z** 欧拉角 / 旋转矩阵转换。
- 检查输入是否为合法旋转矩阵，并对欧拉角奇异情况进行确定性处理。
- 生成字母 **E**、**C** 以及垂直平面 C 形笛卡尔轨迹。
- 使用 `mstraj` 完成多段笛卡尔轨迹插值。
- 将轨迹映射到 PUMA 560 工作空间，并通过 `ikine6s` 求解析逆运动学。
- 提供不依赖机器人工具箱的旋转转换测试。
- 将原有旋转/平移、DH 建模、正逆运动学和轨迹规划实验重新整理为技术说明，同时不公开教材、课件和参考答案等非本人材料。

## 技术流程

```text
欧拉角 / 路径点
      │
      ├──> 旋转矩阵检查与转换
      │
      └──> 笛卡尔路径生成
                │
                v
             mstraj
                │
                v
          齐次位姿 SE(3)
                │
                v
        PUMA 560 ikine6s
                │
                v
            关节轨迹
                │
                v
             三维仿真
```

## 原课程设计仿真结果

以下图片来自当年的课程设计报告，用作原始成果记录。当前仓库中的公开代码已经在此基础上进行了结构化重构和数学修正。

| 字母 E 路径 | PUMA 560 仿真 |
| --- | --- |
| ![原始字母 E 路径](docs/images/original-letter-e-path.png) | ![原始 PUMA 560 E 仿真](docs/images/original-puma560-letter-e.png) |

| 字母 C 路径 | PUMA 560 仿真 |
| --- | --- |
| ![原始字母 C 路径](docs/images/original-letter-c-path.png) | ![原始 PUMA 560 C 仿真](docs/images/original-puma560-letter-c.png) |

### 垂直平面轨迹

![原始垂直平面仿真](docs/images/original-puma560-vertical-path.png)

## 目录结构

```text
.
├── examples/                 # 可直接运行的 MATLAB 示例
├── src/
│   ├── robot/                # PUMA 560 仿真与依赖检查
│   ├── trajectory/           # 路径生成与 mstraj 插值
│   └── transforms/           # 旋转矩阵 / 欧拉角工具
├── tests/                    # 不依赖机器人工具箱的测试
├── docs/
│   ├── experiments/          # 对原实验内容的公开整理
│   └── images/               # 精选原始仿真截图
├── private-original-reports/ # 私人原始报告归档；Git 默认忽略
├── REQUIREMENTS.md
└── setup_project.m
```

## 快速开始

### 1. 安装依赖

请先查看 [REQUIREMENTS.md](REQUIREMENTS.md)。PUMA 560 和 `mstraj` 示例需要 **Peter Corke Robotics Toolbox for MATLAB**。

### 2. 加载项目代码

在仓库根目录运行：

```matlab
setup_project
```

### 3. 运行基础测试

```matlab
run('tests/run_tests.m')
```

这些测试只针对旋转矩阵与欧拉角函数，不需要 Robotics Toolbox。

### 4. 运行示例

```matlab
run('examples/demo_rotation_conversion.m')
run('examples/demo_letter_e.m')
run('examples/demo_letter_c.m')
run('examples/demo_vertical_letter_c.m')
run('examples/demo_speed_comparison.m')
```

## 本项目采用的旋转约定

原课程代码最大的问题之一，是 `alpha / beta / gamma` 的命名与真实旋转轴顺序不够一致。公开版统一改成明确的轴名称。

Z-Y-X 使用：

```text
R = Rz(z) * Ry(y) * Rx(x)
```

返回角度固定为：

```text
[z, y, x]
```

Z-Y-Z 使用：

```text
R = Rz(phi) * Ry(theta) * Rz(psi)
```

欧拉角分解本身并不唯一，因此在奇异位置会标记 `singular`，并采用固定约定返回其中一个代表解。

## 相比原作业做了什么改进？

原课程设计已经覆盖了需要展示的机器人学概念，但代码形式更接近课堂作业。为了将它变成适合公开作品集的项目，本次整理进行了以下修改：

- 将函数定义与交互式脚本拆开；
- 用明确的 Z/Y/X 参数替代含义不清晰的 `alpha/beta/gamma`；
- 修正 Z-Y-X API 中“输入名称与实际矩阵相乘顺序”不一致的问题；
- 重写 Z-Y-Z 旋转矩阵反解，使正反变换采用同一套数学约定；
- 增加旋转矩阵合法性检查及奇异情况处理；
- 去掉原报告中混用 `rigidBodyTree` 和 Peter Corke `SerialLink` API 的片段，机器人仿真统一使用 Peter Corke 工具箱；
- 把重复的轨迹代码重构为可复用函数；
- 将原来较随意的 E 字母路径改成有明确含义的平面连续笔画；
- 个人原始报告通过 `.gitignore` 保留在本地但不会上传 GitHub；
- 教材、PPT、习题答案和其他非本人材料全部排除，不随公开项目分发。

更详细的来源说明见 [docs/PROJECT_ORIGIN.md](docs/PROJECT_ORIGIN.md)。

## 覆盖的课程知识

项目将原来的三个实验与课程设计整合到同一个技术主题中：

- **刚体变换：**旋转矩阵、齐次变换、RPY / 欧拉角；
- **机器人建模：**标准 DH、改进 DH 与串联机器人模型；
- **运动学：**笛卡尔位姿与 PUMA 560 解析逆运动学；
- **轨迹规划：**多项式轨迹、关节空间轨迹、笛卡尔空间轨迹和多段轨迹；
- **机器人绘图：**E/C 路径、速度变化、尺寸变化与垂直平面路径。

整理后的实验说明位于 [`docs/experiments/`](docs/experiments/)。

## 局限性

- 本项目属于**机器人仿真**，不是实体机械臂控制系统。
- 当前打包环境没有 MATLAB 和 Peter Corke Robotics Toolbox，因此能够进行数学公式与静态代码检查，但不能在此环境中实际执行 PUMA 仿真。
- 逆运动学能否得到合适解还会受到工作空间偏移、工具姿态、工具箱版本和机器人构型选择影响。
- 项目重点是经典运动学与轨迹规划，不包含动力学、闭环控制、避障、SLAM 或视觉感知。

## 技术关键词

`MATLAB` · `机器人学` · `线性代数` · `SO(3)` · `SE(3)` · `欧拉角` · `逆运动学` · `轨迹规划` · `PUMA 560` · `仿真`

## License

重构后的源码采用 [MIT License](LICENSE)。仓库中的少量截图来自作者自己的课程设计报告；教材、教师课件、参考答案等第三方材料不会被重新分发。
