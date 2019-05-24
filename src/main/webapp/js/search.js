$(document).ready(function () {
    $("#ajax-button").on("click", function () {
        $("#search-form").submit();
        // $.ajax({
        //     type: "post",
        //     url: "http://localhost:8888/search",
        //     contentType: "application/json; charset=utf-8",
        //     data: JSON.stringify({
        //         "query": "da"
        //     }),
        //     dataType: "json"
        // }).done(function (result) {
        //     alert(result)
        // }).fail(function () {
        //     alert("Server error!");
        // });
    });
});