<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bonjour = "salut la compagnie";
    String resultat = "";

    if (bonjour != null && bonjour.length() > 0) {
        resultat = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1).toLowerCase();
    }

    out.println(resultat);
%>
