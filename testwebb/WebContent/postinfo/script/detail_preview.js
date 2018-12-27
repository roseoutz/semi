app.RecruitDetailPreviewLayer = Backbone.View.extend({
    el: "#devDetailPreview",
    events: {
        "click .devBtnClose": "onRecruitPreviewPopClose",
        "click .devPreviewMove": "onSetRecruitPreviewDetail",
        "click .devScrap": "onSingleScrapSelect",
        "click .devBtnApply": "onSingleOnlinePassSelect",
        "click .devBtnHomepage": "onHomePagePassSelect",
    },
    initialize: function (options) {
        this.$dimDiv = $("#devTplDimDetailLayer");
        var $parentObj = options.$parentObj != undefined ? options.$parentObj : $("#dev-gi-list");

        $parentObj.on("click", ".devReadPreview", $.proxy(this.onRecruitPreviewPopOpen, this));
        this.$dimDiv.on("click", $.proxy(this.onRecruitPreviewPopClose, this));

        this.openGno = 0;
        this.selGno = 0;
        this.pageCode = options.pageCode;
        this.recmGuinGnoArr = "";
        this.listType = 0;
        this.totalCnt = 0;

        this.userId = options.userId != undefined ? options.userId : "";
        this.scrapBlindState = options.scrapBlindState || false; // 스크랩버튼 숨김 여부

        // 스크랩/입사지원 함수
        this.onScrapFunc = options.onScrapFunc;
        this.onPassFunc = options.onPassFunc;
    },
    onRecruitPreviewPopOpen: function (e) {
        var gno = $(e.currentTarget).data("gno");
        if (gno !== undefined && $.isNumeric(gno)) {
            var $layer = this.$el;
            var that = this;
            $.ajax({
                url: "/Recruit/Home/_GI_Preview_Pop",
                data: { gNo: gno, rPageCode: that.pageCode, blindState: that.scrapBlindState },
                dataType: "html",
                cache: false,
                async: false,
                success: function (data) {
                    if (data != null && data.length > 10) {
                        $layer.html(data);

                        var $devPreview = $layer.find(".devPreviewWrap");
                        that.openGno = $devPreview.data("openGno");
                        that.pageCode = $devPreview.data("pageCode");// "SL";
                        that.recmGuinGnoArr = $devPreview.data("gnoList");
                        that.listType = $devPreview.data("listType");
                        that.totalCnt = $devPreview.data("listTotal");
                        
                        that.selGno = that.openGno;
                        that.onSetRecruitPreviewSmartMatch(that.getPreviewSmartMatchUrl(1));

                        $layer.show();
                        that.$dimDiv.show();

                        //$layer.find(".nano").nanoScroller({ preventPageScrolling: true });
                        $("html").addClass("tplNoScroll");

                        $layer.on("click", ".devGIPagination a", function (e) {
                            e.preventDefault();
                            var href = $(this).attr("href");
                            that.onSetRecruitPreviewSmartMatch(href);
                        });
                    } else {
                        alert("정확한 공고를 선택해 주시기 바랍니다.");
                    }
                },
                error: function (e) {
                    //console.log(e.responseText);
                }
            });
        } else {
            alert("정확한 공고를 선택해 주시기 바랍니다.");
        }
    },
    onRecruitPreviewPopClose: function () {
        this.$el.hide();
        this.$dimDiv.hide();
        this.$el.empty();
        $("html").removeClass("tplNoScroll");
    },
    onSetRecruitPreviewDetail: function (e) {
        var $selector = $(e.currentTarget);
        var gno = $selector.data("gno");
        var page = $selector.data("page");
        var currentPage = this.$el.find(".devPreviewSmartMatchList").length > 0 ? $(".devPreviewSmartMatchList").data("currentPage") : 1;
        var pagesize = this.$el.find(".devPreviewSmartMatchList").length > 0 ? $(".devPreviewSmartMatchList").data("pagesize") : 1;

        var $layer = this.$el;
        if (gno > 0) {
            var that = this;
            $.ajax({
                url: "/Recruit/Home/_GI_Preview_Detail_Form",
                data: { gNo: gno, recmGuinGnoArr: that.recmGuinGnoArr, openGno: that.openGno, pageSize: pagesize, pageCode: that.pageCode, blindState: that.scrapBlindState },
                dataType: "html",
                cache: false,
                async: false,
                success: function (data) {
                    $("#devDetailComt").html(data);

                    that.selGno = gno;
                    if (page > 0 && currentPage != undefined && currentPage != page) {
                        that.onSetRecruitPreviewSmartMatch(that.getPreviewSmartMatchUrl(page));
                    } else {
                        that.setSelectSmartMatch(gno);
                    }
                },
                error: function (e) {
                    //console.log(e.responseText);
                }
            });
        }
    },
    onSetRecruitPreviewSmartMatch: function (url) {
        var that = this;
        if (that.selGno == null || that.selGno <= 0) {
            var $selObj = this.$el.find(".devPreviewSmartMatchList > li.active > button");
            if ($selObj !== undefined) {
                var gno = $selObj.data("gno");
                that.selGno = gno !== undefined && gno != null && $.isNumeric(gno) ? gno : that.selGno;
            }
        }

        $.ajax({
            url: url,
            dataType: "html",
            cache: false,
            async: false,
            success: function (data) {
                $("#devPreviewSmartMatch").html(data);
                if (that.selGno != null && that.selGno > 0) {
                    that.setSelectSmartMatch(that.selGno);
                }
            },
            error: function (e) {
                //console.log(e.responseText);
            }
        });
    },
    onSingleScrapSelect: function (e) { // 스크랩
        var $selector = $(e.currentTarget);
        var rScrapStat = 1;

        var info = this.setAgiBaseInfo();

        if (info.giNo.length > 10) {
            alert("워크넷 채용공고는 스크랩 하실 수 없습니다.");
            return exist;
        }

        rScrapStat = $selector.hasClass('on') ? 0 : 1;

        this._onScrapFunc(info.giNo, info.gNo, info.memId, info.memTypeCode, rScrapStat);
    },
    onSingleOnlinePassSelect: function (e) { // 입사지원
        var $selector = $(e.currentTarget);
        var info = this.setAgiBaseInfo();
        
        this._onPassFunc(info.giNo, info.gNo);
    },
    onHomePagePassSelect: function (e) {
        var herf = $(e.currentTarget).data("href");

        if (herf !== undefined && herf.length > 0) {
            window.open(herf);
        }   
    },
    getPreviewSmartMatchUrl: function (page) {
        return "/Recruit/Home/_GI_Preview_SmartMatchList?gNo=" + this.openGno + "&PageCode=" + this.pageCode + "&ListType=" + this.listType + "&page=" + page + "&totalCnt=" + this.totalCnt;
    },
    setSelectSmartMatch: function (gno) {
        this.$el.find(".devPrevSmartMatchRow").prop("disabled", false).parent("li").removeClass("active");
        this.$el.find(".devPrevSmartMatchRow[data-gno=" + gno + "]").prop("disabled", true).parent("li").addClass("active");
    },
    setAgiBaseInfo: function() {
        var info = {
            gNo: 0,
            giNo: 0,
            memId: undefined,
            memTypeCode: undefined,
            positionCode: undefined
        }

        var data = this.$el.find(".devBaseInfo").attr("data-info"); // $selector.closest('.devBaseInfo').attr('data-info')

        if (data !== undefined) {
            var dataArr = data.split("|");

            if (data !== undefined && data.indexOf("|") > -1) {
                info.gNo = Number(dataArr[0]);
                info.giNo = Number(dataArr[1]);
                info.memId = String(dataArr[2]);
                info.memTypeCode = String(dataArr[3]);
                //info.pageCode = String(dataArr[4]);
                info.positionCode = String(dataArr[5]);
            }
        }

        return info;
    },
    _onScrapFunc: function (giNo, gNo, memId, memTypeCode, scrapState) {
        if (this.onScrapFunc) {
            this.onScrapFunc.call(this, giNo, gNo, memId, memTypeCode, scrapState);
        }
    },
    _onPassFunc: function (giNo, gNo, pageCode) {
        if (this.onPassFunc) {
            this.onPassFunc.call(this, giNo, gNo, pageCode);
        }
    }
});

var autoResize = function (obj) {
    var iframeHeight = obj.contentWindow.document.body.scrollHeight;
    obj.height = (iframeHeight + 2) + 'px';
}

var ifrmNavi = function (arg, parent) {
    if (navigator.userAgent.indexOf('Mac') != -1) {
        setTimeout(function () { autoResize(arg); }, 3000);
    } else {
        if (navigator.appName == "Opera") {
            setTimeout(function () { autoResize(arg); }, 3000);
        } else {
            autoResize(arg);
        }
    }       
    if (parent != undefined) {
        $(parent).find(".nano").nanoScroller({ scrollTop: 0 });
    }
}