<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="login_id">ログインID</label><br />
<input type="text" name="login_id" value="${user.login_id}" />
<br /><br />

<label for="name">ユーザーネーム</label><br />
<input type="text" name="name" value="${user.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="password" name="password" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">送信</button>