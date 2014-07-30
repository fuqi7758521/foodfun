var ComingSoon = function () {

    return {
        //main function to initiate the module
        init: function () {

            $.backstretch([
    		        "/foodfun/pages/general/assets/img/bg/10.png",
    		        "/foodfun/pages/general/assets/img/bg/8.png",
    		        "/foodfun/pages/general/assets/img/bg/5.png",
    		        "/foodfun/pages/general/assets/img/bg/11.png"
    		        ], {
    		          fade: 1000,
    		          duration: 4000
    		    });

            var austDay = new Date();
            austDay = new Date(austDay.getFullYear(), 07, 01);
            $('#defaultCountdown').countdown({until: austDay});
           // $('#year').text(austDay.getFullYear());
        }

    };

}();