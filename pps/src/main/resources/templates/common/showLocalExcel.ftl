<!DOCTYPE HTML>

<html>
<head>
    <#include "head.ftl">
</head>

<body>
<div id="spreadsheet" style="width: 100%;"></div>
<div id="dialog"></div>
<script type="text/javascript">

    var titles = ${titles};
    var isCheckData = false;
    var insertUrl = "${insertUrl}";
    var baseFiled = ${baseFiled};
    var onlyCellValues;

    $(document).ready(function () {

        $("#dialog").kendoDialog({
            width: "300px",
            visible: false,
            modal: true,
            actions: [
                {text: '确定', primary: true}
            ]
        });

        $("#spreadsheet").kendoSpreadsheet({
            toolbar: {
                home: ["open",
                    {
                        type: "button",
                        text: "check",
                        spriteCssClass: "k-icon k-i-validation-data",
                        click: function () {
                            var spreadsheet = $("#spreadsheet").data("kendoSpreadsheet");
                            $(spreadsheet.sheets()).each(function () {
                                var sheetTitles = findTitleRow(this.toJSON());
                                if (sheetTitles != null) {
                                    this.titles = sheetTitles;
                                    this.titleIndex = sheetTitles[0].excelRowIndex;
                                    setTitleBackground(this);
                                    getFirstLastRowIndex(this);
                                    onlyCellValues = {};
                                    setValidation(this);
                                }
                            });
                        }
                    },
                    {
                        type: "button",
                        text: "save",
                        spriteCssClass: "k-icon k-i-save",
                        click: function () {
                            kendo.ui.progress($("body"), true);
                            var spreadsheet = $("#spreadsheet").data("kendoSpreadsheet");
                            var modelList = [];
                            var model;
                            var hasError = false;
                            $(spreadsheet.sheets()).each(function () {
                                if (hasError) {
                                    return false;
                                }
                                if (this.titleIndex === undefined) {
                                    return true;
                                }
                                var titles = this.titles;
                                var titleMap = {};
                                $(titles).each(function () {
                                    titleMap[this.excelColIndex] = this;
                                });
                                var firstRowIndex = this.firstRowIndex;
                                var jsonData = this.toJSON();

                                $(jsonData.rows).each(function () {
                                    if (hasError) {
                                        return false;
                                    }
                                    if (this.index < firstRowIndex) {
                                        return true;
                                    }
                                    model = {};
                                    $(this.cells).each(function () {
                                        if (hasError) {
                                            return false;
                                        }
                                        if (this.background === "#ff0000") {
                                            hasError = true;
                                            return false;
                                        }
                                        if (titleMap[this.index] && this.value) {
                                            if (titleMap[this.index].modelFieldType.endsWith("Date")) {
                                                model[titleMap[this.index].modelFieldName] = new Date(this.value * 24 * 60 * 60 * 1000 - 2208988800000 - 56 * 60 * 60 * 1000);
                                            } else {
                                                if (titleMap[this.index].changeMap) {
//                                                        if (titleMap[this.index].changeMap[this.value]) {
                                                    model[titleMap[this.index].modelFieldName] = titleMap[this.index].changeMap[this.value];
//                                                        }
                                                } else {
                                                    model[titleMap[this.index].modelFieldName] = this.value;
                                                }
                                            }
                                        }
                                    });
                                    $.each(baseFiled, function (key, val) {
                                        model[key] = val;
                                    });
                                    modelList.push(model);
                                });
                            });
                            if (hasError) {
                                $("#dialog").data("kendoDialog").title("错误");
                                $("#dialog").data("kendoDialog").content("单元格内有非法数据,请修改");
                                $("#dialog").data("kendoDialog").open();
                                return;
                            }
                            if (modelList.length === 0) {
                                $("#dialog").data("kendoDialog").title("错误");
                                $("#dialog").data("kendoDialog").content("无可导入数据");
                                $("#dialog").data("kendoDialog").open();
                                return;
                            }
                            $.ajax({
                                type: "POST",
                                url: insertUrl,
                                contentType: "application/json",
                                dataType: "json",
                                data: kendo.stringify(modelList),
                                success: function () {
                                    window.parent.closeExcelWindow();
                                }
                            });
                        }
                    },
                    "exportAs", ["cut", "copy", "paste"]
                ],
                insert: false,
                data: false
            },
            change: function (e) {
                if (e.range.sheet().titleIndex === undefined || isCheckData) {
                    return;
                }
                if (e.range._ref.topLeft.row < e.range.sheet().titleIndex + 1) {
                    return;
                }
                var title = getTitleByExcelColIndex(e.range.sheet().titles, e.range._ref.topLeft.col);
                if (!title) {
                    return;
                }
                isCheckData = true;
                checkCellRange(e.range, title);
                isCheckData = false;
            }
        });

        $("#spreadsheet input[title='Open...']").attr("title", "打开导入Excel文件");
        $($("#spreadsheet a[data-tool='[object Object]']").get(0)).attr("title", "校验数据");
        $($("#spreadsheet a[data-tool='[object Object]']").get(1)).attr("title", "保存数据");
        $("#spreadsheet a[data-tool='[object Object]'] span").removeClass("k-sprite");

    });

    /**
     * 查找是否有表头
     */
    function findTitleRow(sheet) {
        var baseExcelTitles = [];
        var rowIndex = -1;
        var sheetTitles = [];
        var cellValues;
        $.extend(sheetTitles, titles);
        $(sheetTitles).each(function () {
            baseExcelTitles.push(this.title);
        });
        var row;
        var allExist = true;
        $(sheet.rows).each(function () {
            row = this;
            allExist = true;
            cellValues = [];
            $(row.cells).each(function () {
                if (this == null || this.value == null) {
                    return true;
                }
                cellValues.push(this.value.toString().trim().replace(/\s/g, ""));
            });
            $(sheetTitles).each(function () {
                if ($.inArray(this.title, cellValues) === -1) {
                    allExist = false;
                    return false;
                }
            });
            if (!allExist) {
                return true;
            }
            $(sheetTitles).each(function () {
                var title = this;
                title.excelRowIndex = row.index;
                $(row.cells).each(function () {
                    if (this == null || this.value == null) {
                        return true;
                    }
                    if (this.value.toString().trim().replace(/\s/g, "") === title.title) {
                        title.excelColIndex = this.index;
                    }
                });
            });
            rowIndex = row.index;
            return false;
        });
        if (rowIndex === -1) {
            return null;
        }
        var sheetTitleIndex = [];
        $(sheetTitles).each(function () {
            sheetTitleIndex.push(this.excelColIndex);
        });
        sheetTitleIndex.sort(sortNumber);
        var sortSheetTitle = [];
        $(sheetTitleIndex).each(function () {
            sortSheetTitle.push(getTitleByExcelColIndex(sheetTitles, this));
        });
        return sortSheetTitle;
    }

    function setTitleBackground(sheet) {
        $(sheet.titles).each(function () {
            sheet.range(this.excelRowIndex, this.excelColIndex, 0, 0).background("#72c5fc");
        });
    }

    /**
     * 获取表格数据最后一行
     */
    function getFirstLastRowIndex(sheet) {
        var lastRowIndex = -1;
        var lastRow;
        var firstRowIndex = null;
        if (!sheet) {
            return;
        }
        var titlesIndex = [];
        $(sheet.titles).each(function () {
            titlesIndex.push(this.excelColIndex);
        });
        var sheetData = sheet.toJSON();
        $(sheetData.rows).each(function () {
            if (this.index <= sheet.titleIndex) {
                return true;
            }
            lastRow = this;
            $(this.cells).each(function () {
                if (!this.value) {
                    return true;
                }
                if ($.inArray(this.index, titlesIndex) === -1) {
                    return true;
                }
                if (this.value.toString().trim().replace(/\s/g, "").length !== 0) {
                    lastRowIndex = lastRow.index;
                    if (firstRowIndex == null) {
                        firstRowIndex = lastRow.index;
                    } else if (firstRowIndex > lastRow.index) {
                        firstRowIndex = lastRow.index;
                    }
                    return false;
                }
            })
        });
        $(sheet.titles).each(function () {
            sheet.firstRowIndex = firstRowIndex;
            sheet.lastRowIndex = lastRowIndex;
        });
    }

    /**
     * 检查数据正确性
     */
    function setValidation(sheet) {
        if (!sheet.titleIndex || sheet.titleIndex === -1) {
            return;
        }
        var range = sheet.range(sheet.firstRowIndex, sheet.titles[0].excelColIndex, sheet.lastRowIndex - sheet.firstRowIndex + 1, sheet.titles[sheet.titles.length - 1].excelColIndex - sheet.titles[0].excelColIndex + 1);
//            console.log(sheet.firstRowIndex);
//            console.log(sheet.lastRowIndex);
//            range.select();
        var titleMap = {};
        $(sheet.titles).each(function () {
            titleMap[this.excelColIndex] = this;
        });
        var cellRange;
        isCheckData = true;
        range.forEachCell(function (row, column, cell) {
            cellRange = sheet.range(row, column, 0, 0);
            if (titleMap[column]) {
                checkCellRange(cellRange, titleMap[column]);
            }
        });
        isCheckData = false;
    }

    /**
     * 检查单元格正确性,并设置背景色
     */
    function checkCellRange(range, title) {
        if (!range.value() || range.value().toString().trim().replace(/\s/g, "").length === 0) {
            if (title.allowNulls) {
                range.background("yellow");
            } else {
                range.value("该字段不能为空");
                range.background("red");
            }
            return;
        }
        if (title.only) {
            if (onlyCellValues[range.value()]) {
                onlyCellValues[range.value()].background("red");
                onlyCellValues[range.value()].value("该字段内容重复");
                range.background("red");
                range.value("该字段内容重复");
                delete onlyCellValues[range.value()];
                return;
            } else {
                onlyCellValues[range.value()] = range;
            }
        }
        if (title.modelFieldType.endsWith("Integer") || title.modelFieldType.endsWith("Long") || title.modelFieldType.endsWith("Double") || title.modelFieldType.endsWith("BigDecimal")) {
            if (isNaN(range.value()) && title.changeMap == null) {
                range.value("该字段为数字类型");
                range.background("red");
            } else {
                range.background("green");
            }
        } else {
            range.background("green");
        }
    }

    /**
     *根据列获取表头信息
     */
    function getTitleByExcelColIndex(titles, colIndex) {
        var title = null;
        $(titles).each(function () {
            if (this.excelColIndex === colIndex) {
                title = this;
                return false
            }
        });
        return title;
    }

    /**
     *排序用
     */
    function sortNumber(a, b) {
        return a - b
    }


</script>
</body>
</html>