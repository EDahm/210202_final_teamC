console.log("Reply Module........");

var BidService = (function(){

	function bidAdd(bid, callback, error){
	 console.log("ADD BID===================");
	 
	 $.ajax({
	 	type : 'post',
	 	url : '/bid/bid_regi',
	 	data : JSON.stringify(bid),
	 	contentType : "application/json; charset=utf-8",
	 	success : function(result, status, xhr){
	 		if(callback){
	 			callback(result);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 		error(er);
	 		}
	 	}
	 	})
	 }
	 
	
	function bidRemove(b_bno, callback, error){
	$.ajax({
		type : 'delete',
		url : '/bid/' + b_bno,
		success : function(deleteResult, status, xhr){
			if(callback){
				callback(deleteResult);
				}
			},
		error : function(xhr, status, er){
			if(error){
				error(er);
			}
		}
		});
		}
	
	function bidList(param, callback, error){
	
	var a_bno = param.a_bno;
	
	var page = param.page || 1;
	
	$.getJSON("/bid/pages/" + a_bno + "/" + page + ".json",
		function(data){
			if(callback){
			callback(data.bidCnt, data.bid_list);
			}
		}).fail(function(xhr,status,err){
		if(error){
			error();
			}
		});
		}
		
	function bidMember(m_num, callback, error){
	
		$.get("/bid/" + m_num + ".json", function(result){
		
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});	
	}
	
			return {
	 		bidAdd : bidAdd,
	 		bidRemove : bidRemove,
	 		bidList : bidList,
	 		bidMember : bidMember
	 		};
	 
})();