<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<script>
  function upload() {
    var $oldFileInput = $('#fileInput');
    var $newFileInput = $('#fileInput').clone();
    
    $oldFileInput.one('change', function() {
    	
    
      $('#fileForm').ajaxSubmit({
        method: 'post',
        url: '/uploadFile.do',
        success: function(data) {
          // data: 서버가 반환해야할 파일의 웹 경로를 의미한다.
          $('#filePath').val(data);
        }, complete: function(data) {
          $oldFileInput.replaceWith($newFileInput);
          $oldFileInput.remove();
        }
      });
      
    });
    
   	$oldFileInput.click();
  }
  
  function uploadFile(){
      var form = $('#FILE_FORM')[0];
      var formData = new FormData(form);
      formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
      formData.append("fileObj2", $("#FILE_TAG2")[0].files[0]);

      $.ajax({
          url: '',
                  processData: false,
                  contentType: false,
                  data: formData,
                  type: 'POST',
                  success: function(result){
                      alert("업로드 성공!!");
                  }
          });
  }


</script>
<body>
<!-- DB 저장 폼 -->
<form>
    <input type="text" id="filePath" name="filePath" />
    <button type="button" onclick="upload()">파일첨부</button>
</form>

<!-- 파일 업로드 폼 -->
<form id="fileForm" style="display: none;">
    <input type="file" id="fileInput" name="fileInput">
</form>


<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
	<input type="file" id="FILE_TAG" name="FILE_TAG">
	<input type="file" id="FILE_TAG2" name="FILE_TAG2">
	<a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a>
</form>



</body>
</html>