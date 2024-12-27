<!DOCTYPE html>
<html>
<head>
    <title>Add a New Boutique</title>
</head>
<body>
    <h1>Add a New Boutique</h1>

    <form action="${pageContext.request.contextPath}/add" method="post">
        <label for="name">nom boutique</label>
        <input type="text" id="name" name="name" required><br>

        <label for="nam5e">description du boutique</label>
        <input type="text" id="nauyme" name="na5me" required><br>

        <label for="delegat5ion">ville :</label>
        <input type="text" id="deljhegation" name="delega4tion" required><br>

        <label for="delegation">Delegation (Location):</label>
        <input type="text" id="delegation" name="delegation" required><br>

        <button type="submit">creer une Boutique</button>
    </form>
</body>
</html>
