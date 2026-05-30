# Resume LaTeX Template

基于 XeLaTeX 的中文简历模板，提供无照片和带照片两种版本。

## 项目结构

```
.
├── resume.cls                       # 自定义简历类（所有宏定义）
├── resume-example.tex               # 无照片示例模板
├── resume-example-photo.tex         # 带照片示例模板
├── zh_CN-Adobefonts_external.sty    # 中文 Adobe 字体支持
├── linespacing_fix.sty              # 行距修复
├── fontawesome.sty                  # 图标字体支持
├── Makefile                         # 编译脚本
├── fonts/                           # 字体文件目录
│   ├── fontawesome/
│   └── zh_CN-Adobe/
└── README.md
```

## 安装环境

需要 XeLaTeX 环境。

Arch Linux:
```bash
sudo pacman -S texlive
```

Ubuntu:
```bash
sudo apt install texlive-full
```

## 编译

默认编译 `resume.tex`（个人简历，已通过 `.gitignore` 排除，需自行创建）：

```bash
make
```

通过 `MAIN` 参数指定编译其他模板：

```bash
make MAIN=resume-example.tex        # 无照片模板
make MAIN=resume-example-photo.tex  # 带照片模板
```

清理：

```bash
make clean       # 清除辅助文件
make distclean    # 清除辅助文件及 PDF
```

## 无照片模板

从 `resume-example.tex` 复制后开始编辑：

```bash
cp resume-example.tex resume.tex
```

页眉使用 `\name` 和 `\contactInfo`：

```latex
\name{某某某}
\contactInfo
  {email@example.com}
  {(+86) 1234567890}
  {https://your-blog.com}
```

## 带照片模板

从 `resume-example-photo.tex` 复制后开始编辑：

```bash
cp resume-example-photo.tex resume.tex
```

将照片放到项目根目录，页眉使用 `\makeheader` 一行搞定：

```latex
%           {照片}      {姓名}  {邮箱}            {电话}            {主页}
\makeheader{avatar.jpg}{某某某}{email@example.com}{(+86) 1234567890}{https://your-blog.com}
```

如需调整照片宽度，在 `\begin{document}` 前添加：

```latex
\renewcommand{\photowidth}{2.8cm}  % 默认 3cm
```

## 自定义命令

所有命令定义在 `resume.cls` 中。

| 命令 | 参数 | 说明 |
|------|------|------|
| `\name{姓名}` | 姓名 | 居中显示姓名 |
| `\contactInfo{邮箱}{电话}{主页}` | 邮箱, 电话, 主页 | 三列联系方式 |
| `\makeheader{照片}{姓名}{邮箱}{电话}{主页}` | 照片文件, 姓名, 邮箱, 电话, 主页 | 带照片的页眉（替代 `\name` + `\contactInfo`） |
| `\triplerow{单位}{角色}{时间}` | 单位, 角色, 时间 | 三列经历条目 |
| `\triplerowschool{学校}{专业}{时间}` | 学校, 专业, 时间 | 三列教育经历 |
| `\award{奖项}{描述}{时间}` | 奖项, 描述, 时间 | 获奖条目 |
