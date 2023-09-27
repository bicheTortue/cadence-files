

function toggleBullet(elm, plus_or_minus) {
 
 if (plus_or_minus.innerHTML == "[+]") {
   plus_or_minus.innerHTML = "[-]";
 } else {
   plus_or_minus.innerHTML = "[+]";
 }
 var newDisplay = "none";
 var e = elm.nextSibling; 
 while (e != null) {
  if (e.tagName == "UL" || e.tagName == "ul") {
   if (e.style.display == "none") newDisplay = "block";
   break;
  }
  e = e.nextSibling;
 }
 while (e != null) {
  if (e.tagName == "UL" || e.tagName == "ul") e.style.display = newDisplay;
  e = e.nextSibling;
 }
}

function collapseAll() {
  // ensure the top level list item is visible
  var top_ul = top.lhs.nav.document.getElementById("top_list_item_ul");
  top_ul.style.display = "block";
  var top_li = top.lhs.nav.document.getElementById("top_list_item_li");
  top_li.style.display = "block";

  // and collapse the rest
  var ulsts = top.lhs.nav.document.getElementsByTagName('UL');
  for (var j = 0; j < ulsts.length; j++) 
     if (ulsts[j] != top_ul && ulsts[j] != top_li)
        ulsts[j].style.display = "none";

  ulsts = top.lhs.nav.document.getElementsByTagName('ul');
  for (var j = 0; j < ulsts.length; j++) 
     if (ulsts[j] != top_ul && ulsts[j] != top_li)
       ulsts[j].style.display = "none";
}


function setBigIMG(newSRC){
   top.lhs.wv.document.getElementById("bigIMG").src = newSRC;
}


function PrintPageJumpTo(newlocation) {
    for ( var i = 0; i < top.document.anchors.length; i++) {
        var aan = top.document.anchors[i].name;
        if ( aan == newlocation ) {
            var oldlocation = "" + top.document.location; // a copy
            // strip off any # stuff from the end
            var hash_pos = oldlocation.lastIndexOf("#");
            if ( hash_pos != -1 ) {
                var beginning = oldlocation.substring(0, hash_pos);
                var jumpto = beginning + "#" + newlocation;
                top.document.location = jumpto;
                return;
            } else {
                var jumpto = oldlocation + "#" + newlocation;
                top.document.location = jumpto;
                return;
            }
        }
    }
    alert('No master detail exists for ' + newlocation);
}


function centerJumpTo(newlocation) {
    for ( var i = 0; i < top.center.document.anchors.length; i++) {
        var aan = top.center.document.anchors[i].name;
        if ( aan == newlocation ) {
            var oldlocation = "" + top.center.document.location; // a copy
            // strip off any # stuff from the end
            var hash_pos = oldlocation.lastIndexOf("#");
            if ( hash_pos != -1 ) {
                var beginning = oldlocation.substring(0, hash_pos);
                var jumpto = beginning + "#" + newlocation;
                top.center.document.location = jumpto;
                return;
            } else {
                var jumpto = oldlocation + "#" + newlocation;
                top.center.document.location = jumpto;
                return;
            }
        }
    }
    alert('No master detail exists for ' + newlocation);
}

var tooltip=function(){
 var id = 'tt';
 var top = 3;
 var left = 3;
 var maxw = 300;
 var speed = 100;
 var timer = 20;
 var endalpha = 95;
 var alpha = 0;
 var tt,t,c,b,h;
 var ie = document.all ? true : false;
 return{
  show:function(v,w){
   if(tt == null){
    tt = document.createElement('div');
    tt.setAttribute('id',id);
    t = document.createElement('div');
    t.setAttribute('id',id + 'top');
    c = document.createElement('div');
    c.setAttribute('id',id + 'cont');
    b = document.createElement('div');
    b.setAttribute('id',id + 'bot');
    tt.appendChild(t);
    tt.appendChild(c);
    tt.appendChild(b);
    document.body.appendChild(tt);
    tt.style.opacity = 0;
    tt.style.filter = 'alpha(opacity=250)';
    document.onmousemove = this.pos;
   }

   tt.style.display = 'block';
   c.innerHTML = v;
   c.innerHTML = c.innerHTML.replace(/\n\r?/g, '<br />');
   tt.style.width = w ? w + 'px' : 'auto';
   if(!w && ie){
    t.style.display = 'none';
    b.style.display = 'none';
    tt.style.width = tt.offsetWidth;
    t.style.display = 'block';
    b.style.display = 'block';
   }
  if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
  h = parseInt(tt.offsetHeight) + top;
  clearInterval(tt.timer);
  tt.timer = setInterval(function(){tooltip.fade(1)},timer);
  },
  showImage:function(v,w){
   if(tt == null){
    tt = document.createElement('div');
    tt.setAttribute('id',id);
    t = document.createElement('div');
    t.setAttribute('id',id + 'top');
    c = document.createElement('div');
    c.setAttribute('id',id + 'cont');
    b = document.createElement('div');
    b.setAttribute('id',id + 'bot');
    tt.appendChild(t);
    tt.appendChild(c);
    tt.appendChild(b);
    document.body.appendChild(tt);
    tt.style.opacity = 0;
    tt.style.filter = 'alpha(opacity=250)';
    document.onmousemove = this.pos;
   }

   tt.style.display = 'block';
   c.innerHTML = '<img src="' + v + '">';
   tt.style.width = w ? w + 'px' : 'auto';
   if(!w && ie){
    t.style.display = 'none';
    b.style.display = 'none';
    tt.style.width = tt.offsetWidth;
    t.style.display = 'block';
    b.style.display = 'block';
   }
  if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
  h = parseInt(tt.offsetHeight) + top;
  clearInterval(tt.timer);
  tt.timer = setInterval(function(){tooltip.fade(1)},timer);
  },


  pos:function(e){
   var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
   var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
   tt.style.top = (u - h) + 'px';
   tt.style.left = (l + left) + 'px';
  },
  fade:function(d){
   var a = alpha;
   if((a != endalpha && d == 1) || (a != 0 && d == -1)){
    var i = speed;
   if(endalpha - a < speed && d == 1){
    i = endalpha - a;
   }else if(alpha < speed && d == -1){
     i = a;
   }
   alpha = a + (i * d);
   tt.style.opacity = alpha * .01;
   tt.style.filter = 'alpha(opacity=' + alpha + ')';
  }else{
    clearInterval(tt.timer);
     if(d == -1){tt.style.display = 'none'}
  }
 },
 hide:function(){
  clearInterval(tt.timer);
   tt.timer = setInterval(function(){tooltip.fade(-1)},timer);
  }
 };
}();

