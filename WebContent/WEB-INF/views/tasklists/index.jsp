<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>タスク一覧</h2>
        <ul>
            <c:forEach var="tasklist" items="${tasklists}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${tasklist.id}">
                        <c:out value="${tasklist.id}" />
                    </a>
                    :<c:out value="${tasklist.title}"></c:out> &gt; <c:out value="${tasklist.content}" />
                </li>
            </c:forEach>
        </ul>
        <div id="pagination">
            (全 ${tasklists_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((tasklists_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="${pageContext.request.contextPath}/new">新規タスクを入力</a></p>

    </c:param>
</c:import>