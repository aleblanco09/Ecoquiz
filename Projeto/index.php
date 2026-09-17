<?php

$host = "localhost";
$db = "Ecoquiz";
$user = "root";
$pass = "";
$charset = "utf8mb4";

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("Erro ao conectar ao banco: " . $e->getMessage());
}

$resultado = null;
$pergunta = null;

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    if (isset($_POST["responder"])) {

        $id = (int) $_POST["id"];
        $respostaUsuario = $_POST["resposta"];

        $stmt = $pdo->prepare("SELECT * FROM pergunta WHERE id = :id");
        $stmt->execute(["id" => $id]);

        $pergunta = $stmt->fetch();

        if (!$pergunta) {
            die("Pergunta não encontrada.");
        }

        if ($respostaUsuario == $pergunta["resposta"]) {
            $resultado = "correto";
        } else {
            $resultado = "errado";
        }
    }

    if (isset($_POST["proxima"])) {
        $pergunta = null;
    }
}

if ($pergunta === null) {
    $stmt = $pdo->query("SELECT * FROM pergunta ORDER BY RAND() LIMIT 1");
    $pergunta = $stmt->fetch();

    if (!$pergunta) {
        die("Não existem perguntas cadastradas.");
    }
}

?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>EcoQuiz</title>
</head>

<body>

<h1>EcoQuiz</h1>

<?php if ($resultado === "correto"): ?>

    <p>Resposta correta!</p>

<?php elseif ($resultado === "errado"): ?>

    <p>Resposta errada!</p>
    <p>A resposta correta era: <?= htmlspecialchars($pergunta["resposta"]) ?></p>

<?php endif; ?>

<p>
    <strong><?= htmlspecialchars($pergunta["enunciado"]) ?></strong>
</p>

<?php if ($resultado === null): ?>

    <form method="POST">

        <input type="hidden" name="id" value="<?= htmlspecialchars($pergunta["id"]) ?>">

        <p>
            <label>
                <input type="radio" name="resposta" value="1" required>
                <?= htmlspecialchars($pergunta["alt1"]) ?>
            </label>
        </p>

        <p>
            <label>
                <input type="radio" name="resposta" value="2">
                <?= htmlspecialchars($pergunta["alt2"]) ?>
            </label>
        </p>

        <p>
            <label>
                <input type="radio" name="resposta" value="3">
                <?= htmlspecialchars($pergunta["alt3"]) ?>
            </label>
        </p>

        <p>
            <label>
                <input type="radio" name="resposta" value="4">
                <?= htmlspecialchars($pergunta["alt4"]) ?>
            </label>
        </p>

        <button type="submit" name="responder">
            Responder
        </button>

    </form>

<?php else: ?>

    <form method="POST">
        <button type="submit" name="proxima">
            Próxima pergunta
        </button>
    </form>

<?php endif; ?>

</body>
</html>