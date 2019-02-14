


var Player = (function(){

    let _timeout = null;
    let _pause = true;
    let _sleep = 200;
    let _step = 1;
    var _index = 1;

    let _dataList = [];
    let _timeField = null;
    let _dateText = null;
    let _count = 0;
    let _container = null;
    let _change = ()=>{};
    let Player =  function (container) {
        if(container === undefined){
            return;
        }
        this.skip = ()=>{};
        this.container = $(container);
        _container = $(container);
        this.isPlay = true;
        this.init();
        this.addListener();
    }
    Player.prototype.init = function(){
        var _this = this;
        this.container.rangeslider({
            polyfill: false,
            // Callback function
            onInit: ()=>{
                //valueOutput(this.$element[0]);
            },
            // Callback function
            onSlide: (position, value) => {

            },
            // Callback function
            onSlideEnd: (position, value) => {
                console.log("skip  value = " + value);
                _this.skip(value - 1);
            }
        });

    }
    Player.prototype.play = function(){
        play();
    }



    Player.prototype.update = function({dataList = [], count, dateText, timeField,
                                        change = function(){},
                                        skip = function(){}
                                       }){
        _change = change;
        this.skip = skip;
        _dateText = dateText;
        _timeField = timeField;
        _count = count;
        if(Object.prototype.toString.call(dataList)  === '[object Array]'){
            _dataList = dataList;
        }
        _container.attr({min: 0,max: _count}).rangeslider('update', true);
        return this;
    }
    Player.prototype.addListener = ()=>{
        $(document).keydown(function(e){
            var e = e || window.event;
            if(e.keyCode==32)
            {
                let i = $(this).find("i");
                if(i.hasClass("fa-play")){
                    play();
                }else{
                    pause();
                }
            }
        });

        $(document).on("click", ".playerBarBtn", function(){
            let i = $(this).find("i");
            if(i.hasClass("fa-play")){
                play();
            }else{
                pause();
            }
        });

        $(document).on("change", "#playerSpeed", function(){
            _step = parseInt($(this).val());
            if (_step == 1){
                _sleep = 950;//(50毫秒绘制时间)
            }else{
                _step /= 5;
                _sleep = 200;
            }
        });


    }


    let play = ()=>{
        let i =  $(".playerBarBtn").find("i");
        i.removeClass("fa-play");
        i.addClass("fa-pause");
        if(_pause){
            _pause = false;
            clear();
            run();
        }
    }
    let pause = ()=>{
        let i =  $(".playerBarBtn").find("i");
        i.removeClass("fa-pause");
        i.addClass("fa-play");
        if(!_pause){
            _pause = true;
        }
    }
    let clear = ()=>{
        window.clearTimeout(_timeout);
    }
    let run = ()=>{
        let temp = parseInt(_container.val()) + _step;
        _index = temp;
        if(temp >= _count){
            _index = _count;
            _container.val(_index).change();
            change();
            pause();
        }else if(_pause){
            window.clearTimeout(_timeout);
            return;
        }

        _container.val(_index).change();
        change();

        _timeout = window.setTimeout(run, _sleep);
    }

    let change = ()=>{
        if(_dataList == undefined || _dataList.length == 0){
            return;
        }
        let i = _index >= _dataList.length ? _dataList.length -1 : _index - 1;
        let dataTime = _dataList[i].time.split(" ");
        $(".playerBarBeginTime").html(dataTime[1]);
        $(".playerBarFinishTime").html(dataTime[0]);

        _change(_index - 1);
    }
    return Player;

})();