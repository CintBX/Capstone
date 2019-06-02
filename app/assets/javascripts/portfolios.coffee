$("span").find("a").click (e) ->
    e.preventDefault()
    section = $(this).attr "href"
    $("html, body").animate
        scrollTop: $(section).offset().top