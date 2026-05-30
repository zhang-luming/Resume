# Makefile for XeLaTeX resume project
# 用法:
#   make                          编译 resume.tex
#   make MAIN=resume-example.tex   编译指定文件

# ------------------------
# 变量定义
# ------------------------
TEX      = xelatex
MAIN    ?= resume.tex           # 默认编译文件，可通过命令行覆盖
OUT      = $(MAIN:.tex=.pdf)    # 自动推导 PDF 文件名
CLS      = resume.cls
STYFILES = fontawesome.sty linespacing_fix.sty zh_CN-Adobefonts_external.sty

# 字体文件目录
FONTS = $(shell find fonts -type f)

# 所有源文件
SRC = $(MAIN) $(CLS) $(STYFILES) $(FONTS)

# ------------------------
# 默认目标
# ------------------------
all: $(OUT)

# ------------------------
# 编译规则
# ------------------------
$(OUT): $(SRC)
	@echo "Compiling $(MAIN) -> $(OUT) ..."
	$(TEX) -interaction=nonstopmode $(MAIN)
	$(TEX) -interaction=nonstopmode $(MAIN)

# ------------------------
# 清理辅助文件
# ------------------------
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.log *.toc *.out *.lof *.lot *.bbl *.blg *.nav *.snm

# ------------------------
# 完全清理，包括 PDF
# ------------------------
distclean: clean
	@echo "Removing PDF..."
	rm -f $(OUT)
