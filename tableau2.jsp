<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    List<Integer> tableau = (List<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");

    if ("ajouter".equals(action)) {
        String val = request.getParameter("valeur");
        try {
            int valeur = Integer.parseInt(val);
            if (tableau.size() < 10) {
                tableau.add(valeur);
                message = "Valeur ajoutée avec succès.";
            } else {
                message = "Erreur : le tableau est plein.";
            }
        } catch (Exception e) {
            message = "Erreur : valeur invalide.";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée.";
        } else {
            message = "Erreur : tableau vide, rien à supprimer.";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "Tableau vidé avec grand succès.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Tableau </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 40px;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #ccc;
            max-width: 450px;
            margin: auto;
        }
        input[type="number"] {
            width: 100px;
            padding: 8px;
        }
        button {
            padding: 10px 20px;
            margin: 5px;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #e7f3fe;
            border: 1px solid #2196F3;
            color: #0b5394;
            border-radius: 5px;
        }
        .output {
            margin-top: 20px;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Gestion du Tableau</h2>
    <form method="post">
        <label>Entrer une valeur :</label>
        <input type="number" name="valeur" />
        <br><br>
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <button type="submit" name="action" value="supprimer">Supprimer la dernière</button>
        <button type="submit" name="action" value="afficher">Afficher le tableau</button>
        <button type="submit" name="action" value="vider">Vider le tableau</button>
    </form>

    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <% if ("afficher".equals(action)) { %>
        <div class="output">
            <strong>Contenu du tableau :</strong><br>
            <% if (tableau.isEmpty()) { %>
                Le tableau est vide.
            <% } else { %>
                <%= tableau.toString() %>
            <% } %>
        </div>
    <% } %>
</div>

</body>
</html>

