<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정 목록</title>
    <link rel="stylesheet" type="text/css" href="./resources/datatable/datatables.min.css"/>
 	<script type="text/javascript" src="./resources/datatable/datatables.min.js"></script>
	

<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>

</head>
<body>
<h4>과정 목록</h4>
<p>
<table id="example" class="table table-striped table-bordered" style="width:100%">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">코드</th>
      <th scope="col">과정명</th>
      <th scope="col">강의실</th>
      <th scope="col">시간표</th>
      <th scope="col">강의요일</th>
      <th scope="col">총수업시간</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
  </tbody>
</table>
<button type="button" class="btn btn-light">등록</button>
</body>
</html>