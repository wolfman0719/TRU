/*** Zen Module: ZENDemo_Component ***/

self._zenClassIdx['http://www.intersystems.com/zendemo/bullet'] = 'ZENDemo_Component_bullet';
self.ZENDemo_Component_bullet = function(index,id) {
	if (index>=0) {ZENDemo_Component_bullet__init(this,index,id);}
}

self.ZENDemo_Component_bullet__init = function(o,index,id) {
	('undefined' == typeof _ZEN_Component_object__init) ?zenMaster._ZEN_Component_object__init(o,index,id):_ZEN_Component_object__init(o,index,id);
	o.image = '';
	o.text = '';
}
function ZENDemo_Component_bullet_serialize(set,s)
{
	var o = this;s[0]='1201955669';s[1]=o.index;s[2]=o.id;s[3]=o.name;s[4]=set.addObject(o.parent,'parent');s[5]=set.addObject(o.composite,'composite');s[6]=o.aux;s[7]=o.image;s[8]=o.onupdate;s[9]=o.renderFlag;s[10]=o.text;s[11]=o.tuple;s[12]=(o.visible?1:0);
}
function ZENDemo_Component_bullet_getSettings(s)
{
	s['name'] = 'string';
	s['image'] = 'uri';
	s['text'] = 'caption';
	this.invokeSuper('getSettings',arguments);
}
self.ZENDemo_Component_bullet__Loader = function() {
	zenLoadClass('_ZEN_Component_object');
	ZENDemo_Component_bullet.prototype = zenCreate('_ZEN_Component_object',-1);
	var p = ZENDemo_Component_bullet.prototype;
	if (null==p) {return;}
	p.constructor = ZENDemo_Component_bullet;
	p.superClass = ('undefined' == typeof _ZEN_Component_object) ? zenMaster._ZEN_Component_object.prototype:_ZEN_Component_object.prototype;
	p.__ZENcomponent = true;
	p._serverClass = 'ZENDemo.Component.bullet';
	p._type = 'bullet';
	p.serialize = ZENDemo_Component_bullet_serialize;
	p.getSettings = ZENDemo_Component_bullet_getSettings;
}

self._zenClassIdx['http://www.intersystems.com/zendemo/demoTitle'] = 'ZENDemo_Component_demoTitle';
self.ZENDemo_Component_demoTitle = function(index,id) {
	if (index>=0) {ZENDemo_Component_demoTitle__init(this,index,id);}
}

self.ZENDemo_Component_demoTitle__init = function(o,index,id) {
	('undefined' == typeof _ZEN_Component_component__init) ?zenMaster._ZEN_Component_component__init(o,index,id):_ZEN_Component_component__init(o,index,id);
	o.category = 'Zen Demonstration';
	o.title = '';
}
function ZENDemo_Component_demoTitle_serialize(set,s)
{
	var o = this;s[0]='854869362';s[1]=o.index;s[2]=o.id;s[3]=o.name;s[4]=set.addObject(o.parent,'parent');s[5]=set.addObject(o.composite,'composite');s[6]=o.align;s[7]=o.aux;s[8]=o.category;s[9]=o.containerStyle;s[10]=(o.dragEnabled?1:0);s[11]=(o.dropEnabled?1:0);s[12]=(o.dynamic?1:0);s[13]=o.enclosingClass;s[14]=o.enclosingStyle;s[15]=o.error;s[16]=o.height;s[17]=(o.hidden?1:0);s[18]=o.hint;s[19]=o.hintClass;s[20]=o.hintStyle;s[21]=o.label;s[22]=o.labelClass;s[23]=o.labelDisabledClass;s[24]=o.labelStyle;s[25]=o.onafterdrag;s[26]=o.onbeforedrag;s[27]=o.ondrag;s[28]=o.ondrop;s[29]=o.onhide;s[30]=o.onrefresh;s[31]=o.onshow;s[32]=o.onupdate;s[33]=o.overlayMode;s[34]=o.renderFlag;s[35]=(o.showLabel?1:0);s[36]=o.slice;s[37]=o.title;s[38]=o.tuple;s[39]=o.valign;s[40]=(o.visible?1:0);s[41]=o.width;
}
function ZENDemo_Component_demoTitle_getSettings(s)
{
	s['name'] = 'string';
	s['category'] = 'caption';
	s['title'] = 'caption';
	this.invokeSuper('getSettings',arguments);
}

self.ZENDemo_Component_demoTitle_ReallyRefreshContents = function() {
	zenInstanceMethod(this,'ReallyRefreshContents','','',arguments);
}
self.ZENDemo_Component_demoTitle__Loader = function() {
	zenLoadClass('_ZEN_Component_component');
	ZENDemo_Component_demoTitle.prototype = zenCreate('_ZEN_Component_component',-1);
	var p = ZENDemo_Component_demoTitle.prototype;
	if (null==p) {return;}
	p.constructor = ZENDemo_Component_demoTitle;
	p.superClass = ('undefined' == typeof _ZEN_Component_component) ? zenMaster._ZEN_Component_component.prototype:_ZEN_Component_component.prototype;
	p.__ZENcomponent = true;
	p._serverClass = 'ZENDemo.Component.demoTitle';
	p._type = 'demoTitle';
	p.serialize = ZENDemo_Component_demoTitle_serialize;
	p.getSettings = ZENDemo_Component_demoTitle_getSettings;
	p.ReallyRefreshContents = ZENDemo_Component_demoTitle_ReallyRefreshContents;
}

self._zenClassIdx['http://www.intersystems.com/zendemo/sidebar'] = 'ZENDemo_Component_sidebar';
self.ZENDemo_Component_sidebar = function(index,id) {
	if (index>=0) {ZENDemo_Component_sidebar__init(this,index,id);}
}

self.ZENDemo_Component_sidebar__init = function(o,index,id) {
	('undefined' == typeof _ZEN_Component_component__init) ?zenMaster._ZEN_Component_component__init(o,index,id):_ZEN_Component_component__init(o,index,id);
	o.bullets = new Array();
	o.text = '';
}
function ZENDemo_Component_sidebar_serialize(set,s)
{
	var o = this;s[0]='1573449175';s[1]=o.index;s[2]=o.id;s[3]=o.name;s[4]=set.addObject(o.parent,'parent');s[5]=set.addObject(o.composite,'composite');s[6]=o.align;s[7]=o.aux;s[8]=set.serializeList(o,o.bullets,true,'bullets');s[9]=o.containerStyle;s[10]=(o.dragEnabled?1:0);s[11]=(o.dropEnabled?1:0);s[12]=(o.dynamic?1:0);s[13]=o.enclosingClass;s[14]=o.enclosingStyle;s[15]=o.error;s[16]=o.height;s[17]=(o.hidden?1:0);s[18]=o.hint;s[19]=o.hintClass;s[20]=o.hintStyle;s[21]=o.label;s[22]=o.labelClass;s[23]=o.labelDisabledClass;s[24]=o.labelStyle;s[25]=o.onafterdrag;s[26]=o.onbeforedrag;s[27]=o.ondrag;s[28]=o.ondrop;s[29]=o.onhide;s[30]=o.onrefresh;s[31]=o.onshow;s[32]=o.onupdate;s[33]=o.overlayMode;s[34]=o.renderFlag;s[35]=(o.showLabel?1:0);s[36]=o.slice;s[37]=o.text;s[38]=o.title;s[39]=o.tuple;s[40]=o.valign;s[41]=(o.visible?1:0);s[42]=o.width;
}
function ZENDemo_Component_sidebar_getSettings(s)
{
	s['name'] = 'string';
	s['bullets'] = 'string';
	s['text'] = 'caption';
	this.invokeSuper('getSettings',arguments);
}

self.ZENDemo_Component_sidebar_ReallyRefreshContents = function() {
	zenInstanceMethod(this,'ReallyRefreshContents','','',arguments);
}
self.ZENDemo_Component_sidebar__Loader = function() {
	zenLoadClass('_ZEN_Component_component');
	ZENDemo_Component_sidebar.prototype = zenCreate('_ZEN_Component_component',-1);
	var p = ZENDemo_Component_sidebar.prototype;
	if (null==p) {return;}
	p.constructor = ZENDemo_Component_sidebar;
	p.superClass = ('undefined' == typeof _ZEN_Component_component) ? zenMaster._ZEN_Component_component.prototype:_ZEN_Component_component.prototype;
	p.__ZENcomponent = true;
	p._serverClass = 'ZENDemo.Component.sidebar';
	p._type = 'sidebar';
	p.serialize = ZENDemo_Component_sidebar_serialize;
	p.getSettings = ZENDemo_Component_sidebar_getSettings;
	p.ReallyRefreshContents = ZENDemo_Component_sidebar_ReallyRefreshContents;
}

self._zenClassIdx['http://www.intersystems.com/zendemo/demoMenu'] = 'ZENDemo_Component_demoMenu';
self.ZENDemo_Component_demoMenu = function(index,id) {
	if (index>=0) {ZENDemo_Component_demoMenu__init(this,index,id);}
}

self.ZENDemo_Component_demoMenu__init = function(o,index,id) {
	('undefined' == typeof _ZEN_Component_composite__init) ?zenMaster._ZEN_Component_composite__init(o,index,id):_ZEN_Component_composite__init(o,index,id);
}
function ZENDemo_Component_demoMenu_serialize(set,s)
{
	var o = this;s[0]='4096323540';s[1]=o.index;s[2]=o.id;s[3]=o.name;s[4]=set.addObject(o.parent,'parent');s[5]=set.addObject(o.composite,'composite');s[6]=o.align;s[7]=o.aux;s[8]=o.cellAlign;s[9]=o.cellSize;s[10]=o.cellStyle;s[11]=o.cellVAlign;s[12]=set.serializeList(o,o.children,true,'children');s[13]=(o.childrenCreated?1:0);s[14]=o.containerStyle;s[15]=(o.disabled?1:0);s[16]=(o.dragEnabled?1:0);s[17]=(o.dropEnabled?1:0);s[18]=(o.dynamic?1:0);s[19]=o.enclosingClass;s[20]=o.enclosingStyle;s[21]=o.error;s[22]=o.groupClass;s[23]=o.groupStyle;s[24]=o.height;s[25]=(o.hidden?1:0);s[26]=o.hint;s[27]=o.hintClass;s[28]=o.hintStyle;s[29]=o.label;s[30]=o.labelClass;s[31]=o.labelDisabledClass;s[32]=o.labelPosition;s[33]=o.labelStyle;s[34]=o.layout;s[35]=o.onafterdrag;s[36]=o.onbeforedrag;s[37]=o.onclick;s[38]=o.ondrag;s[39]=o.ondrop;s[40]=o.onhide;s[41]=o.onrefresh;s[42]=o.onshow;s[43]=o.onupdate;s[44]=o.overlayMode;s[45]=o.renderFlag;s[46]=(o.showLabel?1:0);s[47]=o.slice;s[48]=o.title;s[49]=o.tuple;s[50]=o.valign;s[51]=(o.visible?1:0);s[52]=o.width;
}
function ZENDemo_Component_demoMenu_getSettings(s)
{
	s['name'] = 'string';
	this.invokeSuper('getSettings',arguments);
}

self.ZENDemo_Component_demoMenu_ReallyRefreshContents = function() {
	zenInstanceMethod(this,'ReallyRefreshContents','','',arguments);
}
self.ZENDemo_Component_demoMenu__Loader = function() {
	zenLoadClass('_ZEN_Component_composite');
	ZENDemo_Component_demoMenu.prototype = zenCreate('_ZEN_Component_composite',-1);
	var p = ZENDemo_Component_demoMenu.prototype;
	if (null==p) {return;}
	p.constructor = ZENDemo_Component_demoMenu;
	p.superClass = ('undefined' == typeof _ZEN_Component_composite) ? zenMaster._ZEN_Component_composite.prototype:_ZEN_Component_composite.prototype;
	p.__ZENcomponent = true;
	p._serverClass = 'ZENDemo.Component.demoMenu';
	p._type = 'demoMenu';
	p.serialize = ZENDemo_Component_demoMenu_serialize;
	p.getSettings = ZENDemo_Component_demoMenu_getSettings;
	p.ReallyRefreshContents = ZENDemo_Component_demoMenu_ReallyRefreshContents;
}
/* EOF */