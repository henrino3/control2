
$(document).ready(function () {

    (function ($) {

        $('#filter').keyup(function () {

            var rex = new RegExp($(this).val(), 'i');
            $('.searchable tr').hide();
            $('.searchable tr').filter(function () {
                return rex.test($(this).text());
            }).show();

        })

    }(jQuery));

});

function bankPage(option){
	if(option == "dashboard"){
       $("#dashboard").show();
       $("#accounts").hide();
       $("#profile").hide();

	}
	else if (option == "accounts"){
	   $("#accounts").show();
       $("#dashboard").hide();
       $("#profile").hide();
	}
	else{
	   $("#profile").show();
       $("#dashboard").hide();
       $("#accounts").hide();

	}
}

 function init(){
       $("#accounts").hide();
       $("#profile").hide();
   }

   
