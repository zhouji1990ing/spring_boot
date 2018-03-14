$(function () {
    if ($().lazyload !== undefined) {
        $("img[original]").lazyload({
            effect: "fadeIn",
            threshold: 200
        });
        
        $("img[data-original]").lazyload({
            effect: "fadeIn",
            threshold: 200
        });
    }
    $(document).on("click",function(){
    	$("#js_profile_qrcode").hide();
    });
    
    $("#post-user").on("click",function(event){
    	event.stopPropagation();
    	$("#js_profile_qrcode").show();
    });

//    $("img[original]").each(function (i, e) {
//        if ($(e).attr("data-s") != undefined || $(e).attr("data-ratio") != undefined) {
//            $(e).attr("style", null);
//        }
//    });

    $("img[data-src]").each(function (i, e) {
        if ($(e).attr("src") == undefined || $(e).attr("src") == '') {
            if ($(e).attr("data-src").indexOf("photo.store.qq.com") < 0) {
            	 var w = $(e).attr("data-w");     	
                 $(e).attr("src", $(e).attr("data-src"));
                
            }
        }
    });

    if ($(".video_iframe").length > 0) {
        $(".video_iframe").each(function (i, v) {
            var src = $(v).attr("src");
            if (src == undefined || src == "") {
                var org = $(v).attr("original") || $(v).attr("data-src");

                if (org != null) {
                	var obj = parseURL(org);
                	var host = obj.host;
                	var protocol = obj.protocol;
                	var path = obj.path;
                    if(host == "v.qq.com"){
                    	var vid = obj.params.vid;
                    	
                    	var w = $('#js_content').width();
                    	var h = w*(3/4);
                    	var url = protocol+"://"+host+path+"?vid="+vid+"&width="+w+"&height="+h;
                    	console.log(url);
                    	$(v).attr("width",w)
                    	$(v).attr("height",h)
                        $(v).attr("src", url);
                    	$(v).attr("style", null);
                    }else{
                    	var w = $('#js_content').width();
                    	var h = w*(3/4);
                    	console.log(url);
                    	$(v).attr("width",w)
                    	$(v).attr("height",h)
                        $(v).attr("src", url);
                        $(v).attr("src", org);
                    	$(v).attr("style", null);
                    }
                }
            }
        });
    }
    
    if ($("iframe").length > 0) {
        $("iframe").each(function (i, v) {
            var src = $(v).attr("src");

            if (src == undefined || src == "") {
                var org = $(v).attr("original") || $(v).attr("data-src");

                if (org != null) {

                	var obj = parseURL(org);
                	var host = obj.host;
                	var protocol = obj.protocol;
                	var path = obj.path;
                    if(host == "v.qq.com"){
                    	var vid = obj.params.vid;
                    	
                    	var w = $('#js_content').width();
                    	var h = w*(3/4);
                    	var url = protocol+"://"+host+path+"?vid="+vid+"&width="+w+"&height="+h;
                    	console.log(url);
                    	$(v).attr("width",w)
                    	$(v).attr("height",h)
                        $(v).attr("src", url);
                    	$(v).attr("style", null);
                    }else{
                    	var w = $('#js_content').width();
                    	var h = w*(3/4);
                    	console.log(url);
                    	$(v).attr("width",w)
                    	$(v).attr("height",h)
                        $(v).attr("src", url);
                        $(v).attr("src", org);
                    	$(v).attr("style", null);
                    }
                }
            }
        });
    }

});
/**
*@param {string} url 完整的URL地址
*@returns {object} 自定义的对象
*@description 用法示例：var myURL = parseURL('http://abc.com:8080/dir/index.html?id=255&m=hello#top');

myURL.file='index.html'

myURL.hash= 'top'

myURL.host= 'abc.com'

myURL.query= '?id=255&m=hello'

myURL.params= Object = { id: 255, m: hello }

myURL.path= '/dir/index.html'

myURL.segments= Array = ['dir', 'index.html']

myURL.port= '8080'

yURL.protocol= 'http'

myURL.source= 'http://abc.com:8080/dir/index.html?id=255&m=hello#top'

*/
function parseURL(url) {
	 var a =  document.createElement('a');
	 a.href = url;
	 return {
	 source: url,
	 protocol: a.protocol.replace(':',''),
	 host: a.hostname,
	 port: a.port,
	 query: a.search,
	 params: (function(){
	     var ret = {},
	         seg = a.search.replace(/^\?/,'').split('&'),
	         len = seg.length, i = 0, s;
	     for (;i<len;i++) {
	         if (!seg[i]) { continue; }
	         s = seg[i].split('=');
	         ret[s[0]] = s[1];
	     }
	     return ret;
	 })(),
	 file: (a.pathname.match(/\/([^\/?#]+)$/i) || [,''])[1],
	 hash: a.hash.replace('#',''),
	 path: a.pathname.replace(/^([^\/])/,'/$1'),
	 relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [,''])[1],
	 segments: a.pathname.replace(/^\//,'').split('/')
	 };
	}



