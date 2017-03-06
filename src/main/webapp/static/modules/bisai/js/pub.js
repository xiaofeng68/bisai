function validatemobile(mobile){ 
       if(mobile.length==0) 
       { 
          alert('请输入手机号码！'); 
          return false; 
       }     
       if(mobile.length!=11) 
       { 
           alert('请输入有效的手机号码！'); 
           return false; 
       } 
        
       var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/; 
       if(!myreg.test(mobile)) 
       { 
           alert('请输入有效的手机号码！'); 
           return false; 
       } 
       return true;
}