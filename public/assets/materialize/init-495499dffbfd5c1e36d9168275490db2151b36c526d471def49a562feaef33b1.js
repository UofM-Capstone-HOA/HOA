!function(t){t(function(){function e(t){function e(t){return("0"+parseInt(t).toString(16)).slice(-2)}return/^#[0-9A-F]{6}$/i.test(t)?t:(t=t.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/),null===t?"N/A":"#"+e(t[1])+e(t[2])+e(t[3]))}function o(){if(!i.find("#carbonads").length)if(r-=1,r>=0)setTimeout(o,500);else{var e=t('<div id="carbonads"><span><a class="carbon-text" href="#!" onclick="document.getElementById(\'paypal-donate\').submit();"><img src="images/donate.png" /> Help support us by turning off adblock. If you still prefer to keep adblock on for this page but still want to support us, feel free to donate. Any little bit helps.</a></form></span></div>');i.append(e)}}function n(){try{return document.createEvent("TouchEvent"),!0}catch(t){return!1}}var a=t(window).width();t(".dynamic-color .col").each(function(){t(this).children().each(function(){var o=t(this).css("background-color"),n=t(this).attr("class");t(this).html(e(o)+" "+n),(n.indexOf("darken")>=0||t(this).hasClass("black"))&&t(this).css("color","rgba(255,255,255,.9")})}),setTimeout(function(){var e=260,o=t(".toc-wrapper .table-of-contents").length?t(".toc-wrapper .table-of-contents").height():0,n=95,a=t("footer").first().length?t("footer").first().offset().top:0,i=a-n-o-e;t("nav").length?t(".toc-wrapper").pushpin({top:t("nav").height(),bottom:i}):t("#index-banner").length?t(".toc-wrapper").pushpin({top:t("#index-banner").height(),bottom:i}):t(".toc-wrapper").pushpin({top:0,bottom:i})},100);var i=t(".buysellads"),r=3;o(),t(".github-commit").length&&t.ajax({url:"https://api.github.com/repos/dogfalo/materialize/commits/master",dataType:"json",success:function(e){var o=e.sha,n=jQuery.timeago(e.commit.author.date);1120>a&&(o=o.substring(0,7)),t(".github-commit").find(".date").html(n),t(".github-commit").find(".sha").html(o).attr("href",e.html_url)}});var s=t("#flow-toggle");s.click(function(){t("#flow-text-demo").children("p").each(function(){t(this).toggleClass("flow-text")})});var l=t("#container-toggle-button");l.click(function(){t("body .browser-window .container, .had-container").each(function(){t(this).toggleClass("had-container"),t(this).toggleClass("container"),t(this).hasClass("container")?l.text("Turn off Containers"):l.text("Turn on Containers")})}),n()&&t("#nav-mobile").css({overflow:"auto"});var c=document.getElementById("indeterminate-checkbox");null!==c&&(c.indeterminate=!0),t(".carousel.carousel-slider").carousel({full_width:!0}),t(".carousel").carousel(),t(".slider").slider({full_width:!0}),t(".parallax").parallax(),t(".modal-trigger").leanModal(),t(".scrollspy").scrollSpy(),t(".button-collapse").sideNav({edge:"left"}),t(".datepicker").pickadate({selectYears:20}),t("select").not(".disabled").material_select()})}(jQuery);