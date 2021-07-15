/*** Zen Module: TRU_web_component ***/

self._zenClassIdx['DemoTitle'] = 'TRU_web_component_DemoTitle';
self.TRU_web_component_DemoTitle = function(index,id) {
	if (index>=0) {TRU_web_component_DemoTitle__init(this,index,id);}
}

self.TRU_web_component_DemoTitle__init = function(o,index,id) {
	('undefined' == typeof _ZEN_Component_component__init) ?zenMaster._ZEN_Component_component__init(o,index,id):_ZEN_Component_component__init(o,index,id);
	o.category = 'Zen Demonstration';
	o.title = '';
}
function TRU_web_component_DemoTitle_serialize(set,s)
{
	var o = this;s[0]='854869362';s[1]=o.index;s[2]=o.id;s[3]=o.name;s[4]=set.addObject(o.parent,'parent');s[5]=set.addObject(o.composite,'composite');s[6]=o.align;s[7]=o.aux;s[8]=o.category;s[9]=o.containerStyle;s[10]=(o.dragEnabled?1:0);s[11]=(o.dropEnabled?1:0);s[12]=(o.dynamic?1:0);s[13]=o.enclosingClass;s[14]=o.enclosingStyle;s[15]=o.error;s[16]=o.height;s[17]=(o.hidden?1:0);s[18]=o.hint;s[19]=o.hintClass;s[20]=o.hintStyle;s[21]=o.label;s[22]=o.labelClass;s[23]=o.labelDisabledClass;s[24]=o.labelStyle;s[25]=o.onafterdrag;s[26]=o.onbeforedrag;s[27]=o.ondrag;s[28]=o.ondrop;s[29]=o.onhide;s[30]=o.onrefresh;s[31]=o.onshow;s[32]=o.onupdate;s[33]=o.overlayMode;s[34]=o.renderFlag;s[35]=(o.showLabel?1:0);s[36]=o.slice;s[37]=o.title;s[38]=o.tuple;s[39]=o.valign;s[40]=(o.visible?1:0);s[41]=o.width;
}
function TRU_web_component_DemoTitle_getSettings(s)
{
	s['name'] = 'string';
	s['category'] = 'caption';
	s['title'] = 'caption';
	this.invokeSuper('getSettings',arguments);
}

self.TRU_web_component_DemoTitle_ReallyRefreshContents = function() {
	zenInstanceMethod(this,'ReallyRefreshContents','','',arguments);
}
self.TRU_web_component_DemoTitle__Loader = function() {
	zenLoadClass('_ZEN_Component_component');
	TRU_web_component_DemoTitle.prototype = zenCreate('_ZEN_Component_component',-1);
	var p = TRU_web_component_DemoTitle.prototype;
	if (null==p) {return;}
	p.constructor = TRU_web_component_DemoTitle;
	p.superClass = ('undefined' == typeof _ZEN_Component_component) ? zenMaster._ZEN_Component_component.prototype:_ZEN_Component_component.prototype;
	p.__ZENcomponent = true;
	p._serverClass = 'TRU.web.component.DemoTitle';
	p._type = 'DemoTitle';
	p.serialize = TRU_web_component_DemoTitle_serialize;
	p.getSettings = TRU_web_component_DemoTitle_getSettings;
	p.ReallyRefreshContents = TRU_web_component_DemoTitle_ReallyRefreshContents;
}
/* EOF */