!function(t){t(document).ready(function(){function e(e){var i=e.css("font-family"),a=e.css("font-size");a&&s.css("font-size",a),i&&s.css("font-family",i),"off"===e.attr("wrap")&&s.css("overflow-wrap","normal").css("white-space","pre"),s.text(e.val()+"\n");var n=s.html().replace(/\n/g,"<br>");s.html(n),e.is(":visible")?s.css("width",e.width()):s.css("width",t(window).width()/2),e.css("height",s.height())}Materialize.updateTextFields=function(){var e="input[type=text], input[type=password], input[type=email], input[type=url], input[type=tel], input[type=number], input[type=search], textarea";t(e).each(function(e,i){t(i).val().length>0||i.autofocus||void 0!==t(this).attr("placeholder")||t(i)[0].validity.badInput===!0?t(this).siblings("label, i").addClass("active"):t(this).siblings("label, i").removeClass("active")})};var i="input[type=text], input[type=password], input[type=email], input[type=url], input[type=tel], input[type=number], input[type=search], textarea";t(document).on("change",i,function(){0===t(this).val().length&&void 0===t(this).attr("placeholder")||t(this).siblings("label").addClass("active"),validate_field(t(this))}),t(document).ready(function(){Materialize.updateTextFields()}),t(document).on("reset",function(e){var a=t(e.target);a.is("form")&&(a.find(i).removeClass("valid").removeClass("invalid"),a.find(i).each(function(){""===t(this).attr("value")&&t(this).siblings("label, i").removeClass("active")}),a.find("select.initialized").each(function(){var t=a.find("option[selected]").text();a.siblings("input.select-dropdown").val(t)}))}),t(document).on("focus",i,function(){t(this).siblings("label, i").addClass("active")}),t(document).on("blur",i,function(){var e=t(this);0===e.val().length&&e[0].validity.badInput!==!0&&void 0===e.attr("placeholder")&&e.siblings("label, i").removeClass("active"),0===e.val().length&&e[0].validity.badInput!==!0&&void 0!==e.attr("placeholder")&&e.siblings("i").removeClass("active"),validate_field(e)}),window.validate_field=function(t){var e=void 0!==t.attr("length"),i=parseInt(t.attr("length")),a=t.val().length;0===t.val().length&&t[0].validity.badInput===!1?t.hasClass("validate")&&(t.removeClass("valid"),t.removeClass("invalid")):t.hasClass("validate")&&(t.is(":valid")&&e&&i>=a||t.is(":valid")&&!e?(t.removeClass("invalid"),t.addClass("valid")):(t.removeClass("valid"),t.addClass("invalid")))};var a="input[type=radio], input[type=checkbox]";t(document).on("keyup.radio",a,function(e){if(9===e.which){t(this).addClass("tabbed");var i=t(this);return void i.one("blur",function(){t(this).removeClass("tabbed")})}});var s=t(".hiddendiv").first();s.length||(s=t('<div class="hiddendiv common"></div>'),t("body").append(s));var n=".materialize-textarea";t(n).each(function(){var i=t(this);i.val().length&&e(i)}),t("body").on("keyup keydown autoresize",n,function(){e(t(this))}),t(document).on("change",'.file-field input[type="file"]',function(){for(var e=t(this).closest(".file-field"),i=e.find("input.file-path"),a=t(this)[0].files,s=[],n=0;n<a.length;n++)s.push(a[n].name);i.val(s.join(", ")),i.trigger("change")});var l,o="input[type=range]",d=!1;t(o).each(function(){var e=t('<span class="thumb"><span class="value"></span></span>');t(this).after(e)});var r=".range-field";t(document).on("change",o,function(){var e=t(this).siblings(".thumb");e.find(".value").html(t(this).val())}),t(document).on("input mousedown touchstart",o,function(e){var i=t(this).siblings(".thumb"),a=t(this).outerWidth();i.length<=0&&(i=t('<span class="thumb"><span class="value"></span></span>'),t(this).after(i)),i.find(".value").html(t(this).val()),d=!0,t(this).addClass("active"),i.hasClass("active")||i.velocity({height:"30px",width:"30px",top:"-20px",marginLeft:"-15px"},{duration:300,easing:"easeOutExpo"}),"input"!==e.type&&(l=void 0===e.pageX||null===e.pageX?e.originalEvent.touches[0].pageX-t(this).offset().left:e.pageX-t(this).offset().left,0>l?l=0:l>a&&(l=a),i.addClass("active").css("left",l)),i.find(".value").html(t(this).val())}),t(document).on("mouseup touchend",r,function(){d=!1,t(this).removeClass("active")}),t(document).on("mousemove touchmove",r,function(e){var i,a=t(this).children(".thumb");if(d){a.hasClass("active")||a.velocity({height:"30px",width:"30px",top:"-20px",marginLeft:"-15px"},{duration:300,easing:"easeOutExpo"}),i=void 0===e.pageX||null===e.pageX?e.originalEvent.touches[0].pageX-t(this).offset().left:e.pageX-t(this).offset().left;var s=t(this).outerWidth();0>i?i=0:i>s&&(i=s),a.addClass("active").css("left",i),a.find(".value").html(a.siblings(o).val())}}),t(document).on("mouseout touchleave",r,function(){if(!d){var e=t(this).children(".thumb");e.hasClass("active")&&e.velocity({height:"0",width:"0",top:"10px",marginLeft:"-6px"},{duration:100}),e.removeClass("active")}})}),t.fn.material_select=function(e){function i(t,e,i){var s=t.indexOf(e),n=-1===s;return n?t.push(e):t.splice(s,1),i.siblings("ul.dropdown-content").find("li").eq(e).toggleClass("active"),i.find("option").eq(e).prop("selected",n),a(t,i),n}function a(t,e){for(var i="",a=0,s=t.length;s>a;a++){var n=e.find("option").eq(t[a]).text();i+=0===a?n:", "+n}""===i&&(i=e.find("option:disabled").eq(0).text()),e.siblings("input.select-dropdown").val(i)}t(this).each(function(){var a=t(this);if(!a.hasClass("browser-default")){var s=!!a.attr("multiple"),n=a.data("select-id");if(n&&(a.parent().find("span.caret").remove(),a.parent().find("input").remove(),a.unwrap(),t("ul#select-options-"+n).remove()),"destroy"===e)return void a.data("select-id",null).removeClass("initialized");var l=Materialize.guid();a.data("select-id",l);var o=t('<div class="select-wrapper"></div>');o.addClass(a.attr("class"));var d=t('<ul id="select-options-'+l+'" class="dropdown-content select-dropdown '+(s?"multiple-select-dropdown":"")+'"></ul>'),r=a.children("option, optgroup"),c=[],p=!1,h=a.find("option:selected").html()||a.find("option:first").html()||"",u=function(e,i,a){var s=i.is(":disabled")?"disabled ":"",n="optgroup-option"===a?"optgroup-option ":"",l=i.data("icon"),o=i.attr("class");if(l){var r="";return o&&(r=' class="'+o+'"'),"multiple"===a?d.append(t('<li class="'+s+'"><img src="'+l+'"'+r+'><span><input type="checkbox"'+s+"/><label></label>"+i.html()+"</span></li>")):d.append(t('<li class="'+s+n+'"><img src="'+l+'"'+r+"><span>"+i.html()+"</span></li>")),!0}"multiple"===a?d.append(t('<li class="'+s+'"><span><input type="checkbox"'+s+"/><label></label>"+i.html()+"</span></li>")):d.append(t('<li class="'+s+n+'"><span>'+i.html()+"</span></li>"))};r.length&&r.each(function(){if(t(this).is("option"))s?u(a,t(this),"multiple"):u(a,t(this));else if(t(this).is("optgroup")){var e=t(this).children("option");d.append(t('<li class="optgroup"><span>'+t(this).attr("label")+"</span></li>")),e.each(function(){u(a,t(this),"optgroup-option")})}}),d.find("li:not(.optgroup)").each(function(n){t(this).click(function(l){if(!t(this).hasClass("disabled")&&!t(this).hasClass("optgroup")){var o=!0;s?(t('input[type="checkbox"]',this).prop("checked",function(t,e){return!e}),o=i(c,t(this).index(),a),g.trigger("focus")):(d.find("li").removeClass("active"),t(this).toggleClass("active"),g.val(t(this).text())),m(d,t(this)),a.find("option").eq(n).prop("selected",o),a.trigger("change"),"undefined"!=typeof e&&e()}l.stopPropagation()})}),a.wrap(o);var v=t('<span class="caret">&#9660;</span>');a.is(":disabled")&&v.addClass("disabled");var f=h.replace(/"/g,"&quot;"),g=t('<input type="text" class="select-dropdown" readonly="true" '+(a.is(":disabled")?"disabled":"")+' data-activates="select-options-'+l+'" value="'+f+'"/>');a.before(g),g.before(v),g.after(d),a.is(":disabled")||g.dropdown({hover:!1,closeOnClick:!1}),a.attr("tabindex")&&t(g[0]).attr("tabindex",a.attr("tabindex")),a.addClass("initialized"),g.on({focus:function(){if(t("ul.select-dropdown").not(d[0]).is(":visible")&&t("input.select-dropdown").trigger("close"),!d.is(":visible")){t(this).trigger("open",["focus"]);var e=t(this).val(),i=d.find("li").filter(function(){return t(this).text().toLowerCase()===e.toLowerCase()})[0];m(d,i)}},click:function(t){t.stopPropagation()}}),g.on("blur",function(){s||t(this).trigger("close"),d.find("li.selected").removeClass("selected")}),d.hover(function(){p=!0},function(){p=!1}),t(window).on({click:function(){s&&(p||g.trigger("close"))}}),s&&a.find("option:selected:not(:disabled)").each(function(){var e=t(this).index();i(c,e,a),d.find("li").eq(e).find(":checkbox").prop("checked",!0)});var m=function(e,i){if(i){e.find("li.selected").removeClass("selected");var a=t(i);a.addClass("selected"),d.scrollTo(a)}},b=[],w=function(e){if(9==e.which)return void g.trigger("close");if(40==e.which&&!d.is(":visible"))return void g.trigger("open");if(13!=e.which||d.is(":visible")){e.preventDefault();var i=String.fromCharCode(e.which).toLowerCase(),a=[9,13,27,38,40];if(i&&-1===a.indexOf(e.which)){b.push(i);var n=b.join(""),l=d.find("li").filter(function(){return 0===t(this).text().toLowerCase().indexOf(n)})[0];l&&m(d,l)}if(13==e.which){var o=d.find("li.selected:not(.disabled)")[0];o&&(t(o).trigger("click"),s||g.trigger("close"))}40==e.which&&(l=d.find("li.selected").length?d.find("li.selected").next("li:not(.disabled)")[0]:d.find("li:not(.disabled)")[0],m(d,l)),27==e.which&&g.trigger("close"),38==e.which&&(l=d.find("li.selected").prev("li:not(.disabled)")[0],l&&m(d,l)),setTimeout(function(){b=[]},1e3)}};g.on("keydown",w)}})}}(jQuery);