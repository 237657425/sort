var User = function () {
    
	return {
        //main function to initiate the module
        init: function () {
        	User.loadGrid();
    	},
    	loadGrid:function(){
    		var cols =[
    		    { title:'id', name:'id' ,width:100, align:'center', sortable: true},
    		    { title:'登录帐号', name:'account' ,width:100, align:'center', sortable: true},
    		    { title:'姓名', name:'name' ,width:100, align:'center', sortable: true},
				{ title:'账户类型', name:'type' ,width:100, align:'center', sortable: true, type: 'number',renderer: function(val){
    		    	if(val=='0'){
    		    		return "内部运营";
    		    	}else{
    		    		return "外部帐号";
    		    	}
    		    }},
				{ title:'创建时间', name:'gmtCreate' ,width:100, align:'center', sortable: true},
				{ title:'操作', name:'' ,width:100, align:'center', lockWidth:true, lockDisplay: true, renderer: function(val){
                    return '<button  class="btn btn-danger">删除</button>'
                }}
    		];
    		var mmg = $('#user').mmGrid({
                cols: cols, 
                url: 'page',
                ache: false,
                params:{
                	"account":function(){
                		return $("#account").val();
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
                //查看
                if($(e.target).is('.btn-info, .btnPrice')){
                    e.stopPropagation();  //阻止事件冒泡
                    alert(JSON.stringify(item));
                }else if($(e.target).is('.btn-danger') && confirm('你确定要删除该行记录吗?')){
                    e.stopPropagation(); //阻止事件冒泡
                    mmg.removeRow(rowIndex);
                }
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
                console.log('rowUpdated!');
                console.log(oldItem);
                console.log(newItem);
                console.log(index);
            }).on('rowRemoved', function(e, item, index){
            	User.deleteUser(item.account);
            }).load();
    		
    	},
    	deleteUser: function(account){
			gui.util.Ajax.asyncPOST($('#APP_ROOT_PATH').val() + 'user/user_delete',{'account':account},function(data){
				if(data!="y"){
					alert("删除失败，请重试");
				}else{
					location.href=$('#APP_ROOT_PATH').val()+"user/index";
				}
			})	
    	}
    }
}();