(function(){var t,n,e,i;i=function(t){return $(t).openModal()},n=function(t){return $(t).closeModal()},e=function(){return $(this).css("height","")},this.back_no_mod=function(t){return $(t).parent().addClass("active"),$(t).siblings(".collapsible-body").stop(!0,!1).slideDown({duration:350,easing:"easeOutQuart",queue:!1,complete:e()})},this.back=function(t,e){return n(t),document.querySelector("[id^=materialize-lean-overlay]").remove(),this.back_no_mod(e)},t=!1,$(document).on("ready page:update",function(){return $(".clickable-row").click(function(){var n;return t?void 0:(n={show_id:$(this).data("id")},$.get({url:$(this).data("link")},n,function(t){return $("body").html(t)}),t=!0)})})}).call(this);