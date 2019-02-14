/**
 * *********  操作实例  **************
 *   let map = new HashMap();
 *   map.put("key1","Value1");
 *   map.put("key2","Value2");
 *   map.put("key3","Value3");
 *   map.put("key4","Value4");
 *   map.put("key5","Value5");
 *   alert("size："+map.size()+" key1："+map.get("key1"));
 *   map.remove("key1");
 *   map.put("key3","newValue");
 *   let values = map.values();
 *   for(let i in values){
 *       document.write(i+"："+values[i]+"   ");
 *   }
 *   document.write("<br>");
 *   let keySet = map.keySet();
 *   for(let i in keySet){
 *       document.write(i+"："+keySet[i]+"  ");
 *   }
 *   alert(map.isEmpty());
 */

var HashMap = (function () {
    let map = function HashMap(){
        //定义长度
        let length = 0;
        //创建一个对象
        this.object  = new Object();

        /**
         * 判断Map是否为空
         */
        this.isEmpty = function(){
            return length == 0;
        };

        /**
         * 判断对象中是否包含给定Key
         */
        this.containsKey=function(key){
            return (key in this.object);
        };

        /**
         * 判断对象中是否包含给定的Value
         */
        this.containsValue=function(value){
            for(let key in this.object){
                if(this.object[key] == value){
                    return true;
                }
            }
            return false;
        };

        /**
         *向map中添加数据
         */
        this.put=function(key,value){
            if(!this.containsKey(key)){
                length++;
            }
            this.object[key] = value;
        };

        /**
         * 根据给定的Key获得Value
         */
        this.get=function(key){
            return this.containsKey(key)?this.object[key]:null;
        };

        /**
         * 根据给定的Key删除一个值,并且返回当前值
         */
        this.remove=function(key){
            if(this.containsKey(key)){
                let o = Object.assign({}, this.object[key]);
                if(delete this.object[key]){
                    length--;
                    return o;
                }
            }
        };

        /**
         * 删除的一个对象,并且返回当前值
         */
        this.removeFirst=function(){
            let key = Object.keys(this.object)[0];
            if(key !== undefined){
                let o = Object.assign({}, this.object[key]);
                if(delete this.object[key]){
                    length--;
                    return o;
                }
            }
        };

        /**
         * 获得Map中的所有Value
         */
        this.values=function(){
            let _values= new Array();
            for(let key in this.object){
                _values.push(this.object[key]);
            }
            return _values;
        };

        /**
         * 获得Map中的所有Key
         */
        this.keySet=function(){
            return Object.keys(this.object);
        };

        /**
         * 获得Map的长度
         */
        this.size = function(){
            return length;
        };

        /**
         * 清空Map
         */
        this.clear = function(){
            length = 0;
            this.object = new Object();
        };
        /**
         * list初始化
         */
        this.putList = function ({list , key}) {
            if(list !== undefined && Object.prototype.toString.call(list) === "[object Array]" && key !== null){
                for(let i = 0, l = list.length; i < l; i++){
                    this.put(list[i][key], list[i]);
                }
            }
            return this;
        }
        return this;
    }
    return map;
})();