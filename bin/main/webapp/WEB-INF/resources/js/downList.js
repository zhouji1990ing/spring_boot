function bindList(bindElem){
	var Elem=jq(bindElem);if(!Elem) return;
	if(arguments.length<2) arguments[1]={};
	if(!arguments[1]['url']) return;
	
	var iframename = Math.floor(Math.random()*10000)+"AA";
	Elem.autoComplete='off';
	Elem._info ={
		v:[],					//关联数据对象数组
		url:'',					//目标地址
		w:'300',				//弹出框宽度
		h:'196',				//弹出框高度
		type:2,					//1:ajax;2:ifrm,默认2
		rv:[],					//反回数据对象集合
		ib:'1px solid #ccc',	//弹出框边线样式
		ifc:'#333',				//弹出框子体颜色
		ibg:'#ffffff',			//弹出框背景颜色
		scr_x:'hidden',			//div水平滚动样式
		scr_y:'auto',			//div垂直滚动样式,scroll,hidden	
		clickbg:'#ffffe0',		//下拉列表显示时绑定对象的背景[=style.background属性]
		ifrmtag:'ifrm_'+iframename,//ifrm模式时的ifrm名称[name]
		sloading:false,			//是否显示loading
		noreload:true,			//是否禁止同地址重复加载
		timeout:0,				//弹出框多秒后自动关闭,0不关闭
		//滚动条样式
		scr_css:'scrollbar-3dlight-color:threedhighlight;scrollbar-highlight-color:threedhighlight;scrollbar-face-color:#e2e2e2;scrollbar-arrow-color:#999;scrollbar-shadow-color:#e6e6e6;scrollbar-darkshadow-color:#cfcfcf'
	};
	for (var k in arguments[1]){
		Elem._info[k] = arguments[1][k];
	}
	Elem._type=parseInt(Elem._info['type']) || 2;
	Elem.ondblclick=function(){return false};	
	return showList.apply(Elem);Elem=null;
}

function showList(){
//	console.log(this);
	this.creatPop=function(){
		
		this._timer=null;
		this._timeout=null;
		
		jqTL(this);this._v=null;
		this.max_x=this._left+this.offsetWidth;
		this.max_y=this._top+this.offsetHeight;
		this._cls=this.className || '';
		this._popId='pop_'+Math.floor(Math.random()*10000)+"PP";
		this._actcls='actbg_'+Math.floor(Math.random()*10000)+"AC";
		this.ondblclick=function(){return false};
		
		var p=this._info['v'];this._info['v']=null;
		if(p.length>0){
			var _a=[];
			p.each(
				function(arrI){
					var o=jq(arrI);
					if(o){_a.push(o)};o=null;
				}
			);
			if(_a.length>0){this._v=_a};_a=null;
		};p=null;
		
		var a_={};p=this._info['rv'];this._info['rv']=null;		
		if(p.length>0){			
			p.each(
				function(arrI){
					var o=jq(arrI);
					if(o){a_[arrI]=o};o=null;
				}
			);
		};p=null;this.rv=a_;a_=null;
		
		var w=this._info['w']+'px';var h=this._info['h']+'px';		
		var sPop='<div id="'+this._popId+'" style="position:absolute;width:'+w+';height:'+h+';z-index:99;border:'+this._info['ib']+';display:none;background:'+this._info['ibg']+';cursor:default;'+this._info['scr_css'];
		
		if(this._type==1){
			sPop+=';overflow-x:'+this._info['scr_x']+';overflow-y:'+this._info['scr_y']+'"><div pop="'+this._popId+'" style="margin:0px;word-wrap:break-word;word-break:break-all;color:'+this._info['ifc']+'"></div>'
			+'<iframe src="about:blank" style="position:absolute;top:0px;left:0px;z-index:-2;width:'+w+';height:'+h+';margin:0px;visibility:inherit;filter:alpha(opacity=0)"></iframe></div>';
		}else{
			sPop+='"><iframe name="'+this._info['ifrmtag']+'" src="about:blank" style="width:100%;height:'+h+';margin:0px;border:none;overflow-x:'+this._info['scr_x']+';overflow-y:'+this._info['scr_y']+';'+this._info['scr_css']+'" scrolling="yes" frameborder="0"></iframe></div>';
		}
		
		//下拉列表显示时绑定对象的样式
		var ow=document.styleSheets[document.styleSheets.length-1];
		ow.addRule('.'+this._actcls,'background:'+this._info['clickbg']+';');
		
		ow=jq('body,div')[0];
		if(ow) ow.insertAdjacentHTML('beforeEnd',sPop);
		else this.insertAdjacentHTML('afterEnd',sPop);
		ow=null;sPop=null;
		
		this._pop=jq(this._popId);
		this._pop.oldurl='';
		
		if(this._type==2){
			this._ifrm=jq('#'+this._popId+' iframe')[0];
			this._ifrm._elem=this;this._pop.style.overflow='hidden';
		}else this._popcontent=jq('#'+this._popId+' div[pop='+this._popId+']')[0];
		
		this._pop.style.left=this._left-1+'px';
		this._pop.style.top=this._top-2+this.offsetHeight+'px';
		this._pop._elem=this;
		
		this.onkeydown=function(){
			this._pop.hide();
			if(this._timer){clearTimeout(this._timer);this._timer=null}
			this._timer=setTimeout(this.popGet.bind(this),500);
		};
		
		this.popShowAjax=function(x){
			
			this._popcontent.innerHTML=x.responseText;
			this.popShow();
		};
		this.popShow=function(){
			
			if(this._info['clickbg']) this.className=this.className+" "+this._actcls;
			if(this._pop.style.display=='') return;
			this._pop.show();
			if(!this.onblur) this.onblur=this.popHide;
			//if(!this._popcontent.onclick) this._popcontent.onclick=this.popHide.bind(this);
			if(this._info['timeout']>0) this._timeout=setTimeout(this.popHide.bind(this),this._info['timeout']*1000);
		};
		this.popGet=function(){			
			var Vpara=this.getVpara();
			var v=this.name+'='+jqE((this.value || '').trim());//jqV(this).trim()
			
			if(Vpara.length>0){v+='&'+Vpara};Vpara=this._info['url'];
			v=Vpara.indexOf('?')==-1 ? (Vpara+'?'+v):(Vpara+'&'+v);
			
			if(this._info['noreload'] && this._pop.oldurl==v){this.popShow();return}
			
			this._pop.oldurl=v;
			Vpara='<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">'
					+'<tr><td align="center" valign="middle">数据加载中...</td></tr></table>';			
			
			if(this._type==1){
				if(this._info['sloading']){
					this.popShow();
					this._popcontent.innerHTML=Vpara;
				}
				jq.Ajax.get(v,this.popShowAjax.bind(this));
			}else{
				
				if(this._info['sloading']){
					Vpara='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
						+ '<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html;charset=gb2312" /><meta http-equiv="Pragma" content="no-cache"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Expires" content="-1">'
						+ '<style type="text/css">html,body{color:#666;font-size:12px;line-height:18px;width:100%;height:100%;margin:0px;padding:0px}</style></head><body>'+Vpara+'</body></html>';
					
					this._ifrm.contentWindow.document.open("text/html");
					this._ifrm.contentWindow.document.write(Vpara);
					this._ifrm.contentWindow.document.close();
					this.popShow();
				}
				this._ifrm.src=v;//+'&'+Math.random();
				
				this._ifrm.onreadystatechange=function(){
					var s=String(this.readyState).toLowerCase();
					if(s!="complete") return;
					//this._elem.setFrmHeight();
					this._elem.popShow();
				}				
			};Vpara=null;
			
		};
		
		this.popHide=function(){
			if(event){
				var x=event.x,y=event.y;
				if(x>=this._left && x<=this.max_x && y>=this._top && y<=this.max_y) return;
			}
			if(this._info['clickbg']) this.className=this._cls;
			if(this._timeout){clearTimeout(this._timeout);this._timeout=null}
			this._pop.hide();this.onblur=null;
			if(this._ifrm) this._ifrm.onreadystatechange=null;			
		};
		
		this._pop.onmouseout=function(){this._elem.focus();this._elem.onblur=this._elem.popHide}
		this._pop.onmouseover=function(){this._elem.onblur=null}
		
	};
	
	this.setFrmHeight=function(){
		var fm=this._ifrm;if(!fm) return;
		var _e=fm.contentWindow.document.documentElement;
		var _eb=fm.contentWindow.document.body;
		
		var h=_e.scrollHeight;
		if(_eb) h=(_e.scrollHeight || _eb.scrollHeight);
		
		_e=_eb=null;_e=parseInt(this._info['h']);h = h < _e ? _e : h;
		if(h > _e) fm.style.width=parseInt(this._info['w'])-16+'px';fm=null;
	};
	
	this.getVpara=function(){
		if(!this._v) return '';
		var _a=[];
		this._v.each(function(arrI){_a.push(arrI.name+'='+jqE(arrI.value.trim()))});
		var _s=_a.join('&');_a=null;return _s;
	};
	
	if(!this._pop) this.creatPop();	
	this.popGet();return false;
	
}

/*调用:
<input type="text" name="keys" onclick="bindList(this,{type:2,url:'_popFrm.asp?t=aaa',v:jq('input[v=schv]')})" />
<a href="####" name="keys" onclick="bindList(this,{type:1,url:'_popFrm.asp?t=aaa',sloading:true,v:jq('input[v=schv]')})">详细资料</a>
<td name="id" value="<%=arr(0,i)%>" onClick="bindList(this,{w:'530',h:240,clickbg:'#f0f6fc url(/images/thbg01.gif) repeat-x',url:'infoPopFrm/sch_info.asp'})">
*/