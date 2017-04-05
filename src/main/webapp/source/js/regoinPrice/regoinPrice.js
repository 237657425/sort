var RegoinPrice = function () {
    
	return {
        //main function to initiate the module
        init: function () {
        	RegoinPrice.loadGrid();
    	},
    	loadGrid:function(){
    		var cols =[
    		    { title:'id', name:'id' ,width:100, align:'center', sortable: true},
    		    { title:'区域ID', name:'regionId' ,width:100, align:'center', sortable: true},
    		    { title:'区域', name:'region' ,width:100, align:'center', sortable: true},
    		    { title:'班级Id', name:'classId' ,width:100, align:'center', sortable: true},
    		    { title:'班级类型', name:'classType' ,width:100, align:'center', sortable: true},
    		    { title:'班级名', name:'className' ,width:100, align:'center', sortable: true},
				{ title:'45岁以下价格', name:'regionPrice' ,width:100, align:'center', sortable: true},
    		    { title:'45岁以上价格', name:'agePrice' ,width:100, align:'center', sortable: true},
    		    { title:'状态', name:'status' ,width:100, align:'center', sortable: true, type: 'number',renderer: function(val){
    		    	if(val=='0'){
    		    		return "未激活";
    		    	}else{
    		    		return "已激活";
    		    	}
    		    }},
				{ title:'操作', name:'' ,width:100, align:'center', lockWidth:true, lockDisplay: true, renderer: function(val,item,rowIndex){
                    //return '<button  class="btn btn-danger">修改价格</button>'
					return '<a class="btn" href="' + "update_index?id=" + item.id + '" >修改价格</a>';
                }}
    		];
    		var mmg = $('#regoin-price').mmGrid({
                cols: cols, 
                url: 'page',
                ache: false,
                params:{
                	"status":function(){
                		return $("#status").val();
                	},
                	"regionId":function(){
                		return $("#regionId").val();
                	},
                	"region":function(){
                		return $("#region").val();
                	}
                },
                method: 'get', 
                remoteSort:true, 
                sortName: 'SECUCODE', 
                sortStatus: 'asc', 
                multiSelect: true, 
                checkCol: true, 
                fullWidthRows: true, 
                autoLoad: true, 
                limit: 10,
                plugins: [
                    $('#pg').mmPaginator({})
                ]
            });
    		mmg.on('cellSelected', function(e, item, rowIndex, colIndex){
                console.log('cellSelected!');
                console.log(this);
                console.log(e);
                console.log(item);
                console.log(rowIndex);
                console.log(colIndex);
            }).on('loadSuccess', function(e, data){
                //这个事件需要在数据加载之前注册才能触发
                console.log('loadSuccess!');
                console.log(data);
                console.log(mmg.rowsLength());
            }).on('rowInserted', function(e, item, index){
                console.log('rowInserted!');
                console.log(item);
                console.log(index);
                console.log(mmg.rowsLength());
            }).on('rowUpdated', function(e, oldItem, newItem, index){
            	RegoinPrice.upadateRegoinPrice(item.id);
            }).on('rowRemoved', function(e, item, index){
            	
            }).load();
    		
    	},
    }
}();