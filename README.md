# JSP_PROJECT<BOARD>

+ add index.jsp / list.jsp
+ create table 'board'
+ insert test data in the 'board'
+ import and print a statement to 'list.jsp' 
+ add read.jsp 
    + import 1st text.... hardcoding
+ Modifying read.jsp 
    + import text .... url에 get방식으로 넘어온  num값을 조합

    <%=num %> <a href="read.jsp?num=<%=num%>"><%=title %></a> <%=id %><br>

+ Modifying list.jsp
    + url에 get방식으로 넘어온  num값을 조합
+ add common.css
+ add write.jsp 
    + form tag
+ Modifying list.jsp
    + insert link 'write.jsp'
+ add writeproc.jsp
    + insert 'write.jsp' value in the DB
+ modifying read.jsp
    + add delete button
+ add delproc.jsp
+ modifying read.jsp
    + add modify button
+ add modify.jsp
    + 넘겨받은 글 번호로 글 하나를 db에서 가져와서 form에 나타내기
+ add modifyproc.jsp
    + 수정한 글을 update sql문으로 db에 넘긴 후 list.jsp로 강제 이동 시키기


====

## new update
+ add MysqlProc.java
    + 반복하는 sql문을 한 곳에 모았다.
+ modifying all .jsp file
    + MysqlProc에 있는 sql문의 함수를 이용하여 코드 간소화

