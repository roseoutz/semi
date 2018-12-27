(function (factory) {
    var root = (typeof self === 'object' && self.self == self && self) ||
		(typeof global === 'object' && global.global == global && global);

    root.rstnItem = factory(root, {}); //, (root.jQuery || root.$))

})(function (root, r){ //, $) {
    var _limit = 3;
    var _rstnData = null;
    //localstorage->cookie http와https 공유문제로 변경
    if (localStorage && localStorage.getItem('rstn_item')) {
        _rstnData = localStorage.getItem('rstn_item');
        if (_rstnData == null && _rstnData != '') {
            setCookie("rstn_item", _rstnData, 1440, '/', 'jobkorea.co.kr');
        }
        localStorage.removeItem('rstn_item');
    }
    if ((_rstnData == null || _rstnData == '') && getCookie) {
        _rstnData = getCookie("rstn_item", 1440, '/', 'jobkorea.co.kr');
    }

    if (_rstnData == undefined) {
        _rstnData = null;
    }

    var _arrCategory = ['dutyctgr', 'industryctgr', 'local', 'duty', 'industry'];
    var _url = window.location.search.substring(1);

    r.common = {
        // 이건 대분류, 소분류별 정리
        combine_ctgr: function (params) {            
            for (var i = 0; i < _arrCategory.length; i++) {
                
                var category = _arrCategory[i];         
                var subCategory = category.replace('ctgr', '');
                if (category.indexOf('ctgr') > -1) {
                    if (typeof params[category] !== 'undefined') {
                        // 여기서 앞,뒤만 바꿔주면 대분류,소분류 정렬 할 수 있음 저장
                        var data = typeof params[subCategory] === 'undefined' ? params[category] : params[subCategory] + ',' + params[category];
                        params[subCategory] = data;
                        delete params[category];
                    }
                } else {
                    break;
                }
            }
            return params;
        },
        get_params: function (type, url) {
            url = url ? url : _url;

            var query, ctgrObj = {};
            if (url.indexOf('&') > -1) {
                query = {};
                var vars = url.split('&');
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split('=');
                    var key = pair[0];
                    var value = pair[1];

                    if (_arrCategory.indexOf(key.toLowerCase()) < 0) {
                        continue;
                    }                    

                    if (type === 'upper') {
                        key = key.toUpperCase();
                    } else if (type === 'lower') {
                        key = key.toLowerCase();
                    }

                    if (typeof query[key] === 'undefined') {
                        query[key] = decodeURIComponent(value);
                    } else if (typeof query[key] === 'string') {
                        var arr = [query[key], decodeURIComponent(value)]
                        query[key] = arr;
                    } else {
                        query[key].push(decodeURIComponent(value));
                    }
                }
            }

            if (r.common.object_check_empty(query)) {
                query = undefined;
            }

            return query
        },        
        object_check_empty: function (obj) {
            for (var prop in obj) {
                if (obj.hasOwnProperty(prop))
                    return false;
            }
            return JSON.stringify(obj) === JSON.stringify({});
        },
        // DB에서 코드명 추출
        get_code_name: function (category, code) {
            if(code.indexOf("a")>-1||code.indexOf("b")>-1||code.indexOf("c")>-1||code.indexOf("d")>-1)
            {
                code = "0";
            }
            category = category.replace('ctgr', '')
            var url = category === 'duty' || category === 'industry' ? '_searchPartName' : '_searchNameList';
            var text = '';                        
            var options = {
                url: '/Recruit/Home/' + url,
                data: { category: category, keyword: code },
                method: "get",
                cache: true,
                async: false
            };
            JK5Cript.Loader.async(options, function (response, succstat) {
                if (succstat) {
                    text = response;
                }
            });
            return text;
        }
    }

    r.storage = {        
        init: function () {
            this.set_data();
        },
        // 개발 테스트 로그 추출
        test_log: function(){
            console.log(decodeURIComponent(_rstnData));
            console.log(JSON.parse(decodeURIComponent(_rstnData)));
        },
        // item string 생성
        create_item_string: function (sort, code, name) {
            return '"item' + sort + '": {"code":"' + code + '","name":"' + name + '","sort":' + sort + '}';
        },
        // storage 데이터 검색 후 코드명 추출(DB 안다녀올라고)
        get_storage_name: function (category, code) {
            var data = _rstnData;
            var name = '';
            if (data !== null && data !== '') {
                var json = JSON.parse(decodeURIComponent(data));
                if (!r.common.object_check_empty(json)) {
                    for (var key in json[category]) {
                        var item = json[category][key];

                        if (item.code === code) {
                            name = item.name;
                        }
                    }
                }
            }
            return name;
        },
        // _limit - count 개수 만큼 기존 데이터에서 삽입
        pull_data: function (category, count, newCodes) {
            var data = _rstnData;
            var name = '';
            var arrJsonString = new Array();
            var pullCount = _limit - count;
            var index = 0;

            if (pullCount === 0) {
                return false;
            }

            if (data !== null && data !== '') {
                var json = JSON.parse(decodeURIComponent(data))
                if (!r.common.object_check_empty(json)) {
                    for (var key in json[category]) {
                        var item = json[category][key];
                        // 신규 코드와 기존 코드가 달라야 추가
                        if (newCodes.indexOf(item.code) < 0) {
                            arrJsonString.push(this.create_item_string(count + index + 1, item.code, item.name));
                            index++;
                        }
                        if (pullCount === index) {
                            break;
                        }
                    }
                }
            }
            return arrJsonString               
        },
        set_data: function () {
            // url 데이터 수집
            // 일반 저장
            var params = r.common.get_params('lower')
            if (typeof params === 'undefined') {
                return false;
            }
            // 대분류 소분류 저장일 때
            params = r.common.combine_ctgr(params)
            var jsonString = '';
            if (params === undefined) {
                return false;
            }
            for (var i = 0; i < _arrCategory.length; i++) {
                var category = _arrCategory[i];
                var codes = params[category];
                var arrJsonString = new Array();

                if (codes === undefined || codes === '') {
                    var pullData = this.pull_data(category, 0, '');
                    if (typeof pullData !== 'undefined') {
                        arrJsonString = arrJsonString.concat(pullData);
                    }
                    
                } else {
                    var index = 0;
                    var arrCode = codes.split(',');        
                    for (var y = 0; y < arrCode.length; y++) {
                        var code = arrCode[y];
                        var name = '';
                        if (code === '') {
                            continue;
                        } else {
                            // url 코드의 이름을 기존 storage 데이터에서 추출
                            name = this.get_storage_name(category, code);
                            // 없으면 DB 호출
                            if (name === '') {
                                name = r.common.get_code_name(category, code);
                            }
                            // 이름이 있으면 개수 및 json string 생성
                            if (typeof name !== 'undefined' && name !== '') {
                                index++
                                arrJsonString.push(this.create_item_string(index, code, name));
                            }
                        }
                        // 최종 3개
                        if (index === _limit) {
                            break;
                        }
                    }

                    // 카테고리별 신규 데이터가 3개 미만일 경우 기존데이터에서 나머지 채움
                    if (index < _limit) {
                        var pullData = this.pull_data(category, index, codes)
                        if (typeof pullData !== 'undefined') {
                            arrJsonString = arrJsonString.concat(pullData);
                        }
                    }
                }
                if (arrJsonString.length > 0) {
                    jsonSubString = arrJsonString.join(',');
                    jsonSubString = '"' + category + '":' + '{' + jsonSubString + '},';

                    jsonString += jsonSubString;
                }
            }

            jsonString = '{' + jsonString.substring(0, jsonString.length - 1) + '}';
            if (setCookie) {
                setCookie("rstn_item", jsonString, 1440, '/', 'jobkorea.co.kr');
            }
        }        
    }
    return r
})