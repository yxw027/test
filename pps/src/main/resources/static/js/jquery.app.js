/*
Template Name: Greeva - Responsive Bootstrap 4 Admin Dashboard
Author: CoderThemes
File: Main App js
*/


!function ($) {
    'use strict';

    var App = function () {
        this.$body = $('body'),
            this.$window = $(window)
    };


    /**
     * Initlizes the menu - top and sidebar
     */
    App.prototype.initMenu = function () {
        var $this = this;

        // Left menu collapse
        $('.button-menu-mobile').on('click', function (event) {
            event.preventDefault();
            $this.$body.toggleClass("enlarged");

            // sidebar - scroll container
            $('.slimscroll-menu').slimscroll({
                height: 'auto',
                position: 'right',
                size: "8px",
                color: '#9ea5ab',
                wheelStep: 5,
                touchScrollStep: 50
            });
        });

        // Topbar - main menu
        $('.navbar-toggle').on('click', function (event) {
            $(this).toggleClass('open');
        });

        //metis menu
        $("#side-menu").metisMenu();

        // sidebar - scroll container
        $('.slimscroll-menu').slimscroll({
            height: 'auto',
            position: 'right',
            size: "8px",
            color: '#9ea5ab',
            wheelStep: 5,
            touchScrollStep: 50
        });

        // right side-bar toggle
        $('.right-tg1').on('click', function (e) {

        });

        $(document).on('click', '.right-bar-toggle', function (e) {
            let el = $(this).attr("data-target");
            if (el && $(el).length > 0) {
                $(el).toggleClass('right-bar-enabled');
            }
            // $('.project-tg').css("right", "0");
            //$('.project-tg').toggleClass('right-bar-enabled');
            // $('body').toggleClass('right-bar-enabled');
        });
        $(document).on('click', 'body', function (e) {
            if ($(e.target).closest('.right-bar-toggle, .right-bar').length > 0 && $(e.target).closest('.right-bar-close').length == 0) {
                return;
            }
            //$('body').removeClass('right-bar-enabled');
            $('.right-bar').removeClass('right-bar-enabled');
            return;
        });

        // activate the menu in left side bar based on url
        $("#sidebar-menu a").each(function () {
            var pageUrl = window.location.href.split(/[?#]/)[0];
            if (this.href == pageUrl) {
                $(this).addClass("active");
                $(this).parent().addClass("active"); // add active to li of the current link
                $(this).parent().parent().addClass("in");
                $(this).parent().parent().prev().addClass("active"); // add active class to an anchor
                $(this).parent().parent().parent().addClass("active");
                $(this).parent().parent().parent().parent().addClass("in"); // add active to li of the current link
                $(this).parent().parent().parent().parent().parent().addClass("active");
            }
        });
    },

        /**
         * Init the layout - with broad sidebar or compact side bar
         */
        App.prototype.initLayout = function () {
            var $this = this;
            // in case of small size, add class enlarge to have minimal menu
            if ($this.$window.width() < 1025) {
                $this.$body.addClass('enlarged');
            } else {
                if ($this.$body.data('keep-enlarged') != true)
                    $this.$body.removeClass('enlarged');
            }
        },

        //initilizing
        App.prototype.init = function () {
            var $this = this;
            this.initLayout();
            this.initMenu();

            // handle responsiveness when reload
            this.$window.on('resize', function (e) {
                e.preventDefault();
                $this.initLayout();
            });
        },

        $.App = new App, $.App.Constructor = App


}(window.jQuery),
    //initializing main application module
    function ($) {
        "use strict";
        $.App.init();
    }(window.jQuery);
