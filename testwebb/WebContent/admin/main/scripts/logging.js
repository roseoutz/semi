(function () {
    var root = this;

    var Logging = function (obj) {
        if (obj instanceof Logging) return obj;
        if (!(this instanceof Logging)) {
            return new Logging(obj)
        };
        this._wrapped = obj;

    };
    root.Logging = Logging;

    if (typeof $ !== 'undefined') {
        Logging.$ = $ = root.$;
    }
    var $domain = document.domain;

    var $referrer = document.referrer;

    var breaker = {};

    var ArrayProto = Array.prototype, ObjProto = Object.prototype, FuncProto = Function.prototype;
    var
      push = ArrayProto.push,
      slice = ArrayProto.slice,
      concat = ArrayProto.concat,
      toString = ObjProto.toString,
      hasOwnProperty = ObjProto.hasOwnProperty;
    var
      nativeForEach = ArrayProto.forEach,
      nativeMap = ArrayProto.map,
      nativeReduce = ArrayProto.reduce,
      nativeReduceRight = ArrayProto.reduceRight,
      nativeFilter = ArrayProto.filter,
      nativeEvery = ArrayProto.every,
      nativeSome = ArrayProto.some,
      nativeIndexOf = ArrayProto.indexOf,
      nativeLastIndexOf = ArrayProto.lastIndexOf,
      nativeIsArray = Array.isArray,
      nativeKeys = Object.keys,
      nativeBind = FuncProto.bind;

    var each = function (obj, iterator, context) {
        if (obj == null) return;
        if (nativeForEach && obj.forEach === nativeForEach) {
            obj.forEach(iterator, context);
        } else if (obj.length === +obj.length) {
            for (var i = 0, length = obj.length; i < length; i++) {
                if (iterator.call(context, obj[i], i, obj) === breaker) return;
            }
        }
    };

    Logging.extend = function (obj) {
        each(slice.call(arguments, 1), function (source) {

            if (source) {
                for (var prop in source) {
                    obj[prop] = source[prop];
                }
            }
        });
        return obj;
    }

    Logging.getURI = function (url) {
        return url.replace(/.*?:\/\/[a-z0-9.]+/g, "") || "";
    }

    Logging.getKeyword = function (k) {
        return Logging.getParams()[k] || "";
    }

    //디비로깅
    Logging.dblog = function (object, actvts, context) {
        var that = this,
            target = 0,
            source = 0;

        if (typeof object !== 'object') {
            object = {};
        }
        var url = document.location.href.split("?")[0];

        target = actvts && actvts.target;

        if (actvts.source !== undefined) {
            source = actvts.source;
        }

        if (that.getKeyword('sc') !== 'undefined' && that.getKeyword('sc') != "") {
            source = that.getKeyword('sc');
        }

        if (!that.isNumber(target) || !that.isNumber(source) || target <= 0) {
            return;
        }


        that.extend(object, { Target_Code: target, Source_Code: source });

        that.async(object.asyncUrl, "POST", object).done(function (response) {
            if (typeof context === 'function') { context.call(context, that, response); }
        }).error(function (e) {
            //console.log(e.status);
        });
    };


    //클릭디비로깅
    Logging.clickLog = function (selector, object) {
        var that = this;
        $(selector).click(function () {
            that.dblog(object, function (l, r) {
                //if (r == 0) console.log('success');
            }); 
        });
    }

    //바인드로깅
    Logging.bindLog = function (selector, object) {
        var that = this;
        $(selector).bind(function () {
            that.dblog(object, function (l, r) {
                //if (r == 0) console.log('success');
            });
        });
    }

    Logging.async = function (req, method, data) {
        var callback = $.ajax({
            type: method,
            url: req,
            data: data
        });
        return callback;
    };

    Logging.isNumber = function (n) {
        var regexp = /[0-9]/gi;
        return regexp.test(n);
    }

    Logging.getParams = function () {
        var p = [],
            hash;
        var hashes = (String(window.location.href).toLowerCase()).slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            p.push(hash[0]);
            p[hash[0]] = hash[1];
        }
        return p;
    }

    Logging.makeParams = function (k, v, p) {
        var params = "";
        var prefixCode = (p == "") ? "?" : "&"
        if (v) {
            params = prefixCode + k + "=" + v;
        }
        return params;
    }


    Logging.getUrlParams = function () {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) { params[key.toUpperCase()] = value; });
        return params;
    }
}).call(this, (jQuery || $));