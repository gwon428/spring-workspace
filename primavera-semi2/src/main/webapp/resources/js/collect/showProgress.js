$("#btn").click(()=>{
		$.ajax({
			type:"post",
			url:"/update_ok",
			data: $("#update").serialize(),
			
			success: function(result){
				$("#prog").html(result.prog);
				window.location.reload();
			},
			error: function(){
				console.log("에러 발생!");
			}
		})
	})